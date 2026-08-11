/**
 * @file move_picker.c
 *
 * Implementation of move_picker.h
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "move_picker.h"
#include "movegen.h"
#include "types.h"

enum {
  PICKER_STAGE_CAPTURES,
  PICKER_STAGE_QUIETS,
  PICKER_STAGE_DONE,
  PICKER_STAGE_OVERFLOW
};

enum {
  PICKER_HAS_PV = 0x01,
  PICKER_HAS_TT = 0x02,
  PICKER_PV_PENDING = 0x04,
  PICKER_TT_PENDING = 0x08
};

static const uint8_t mvv_lva_rank[7] = {
  0, 1, 2, 6, 3, 4, 5
};

static inline uint8_t moves_are_same(
  const move_t *first,
  const move_t *second
)
{
  return
    first->from == second->from &&
    first->to == second->to &&
    first->flags == second->flags;
}

static void score_captures(
  move_t *moves,
  uint8_t count
)
{
  uint8_t *const board = BOARD;
  move_t *end = moves + count;

  while (moves != end) {
    if (moves->flags & MF_CAPTURE) {
      uint8_t victim =
        moves->flags & MF_EP
          ? PIECE_PAWN
          : PIECE_TYPE(board[moves->to]);
      uint8_t attacker =
        PIECE_TYPE(board[moves->from]);

      moves->score =
        (mvv_lva_rank[victim] << 3) -
        mvv_lva_rank[attacker];
    }

    ++moves;
  }
}

static move_t *move_picker_pick(move_picker_t *picker)
{
  move_t *picked =
    &picker->moves[picker->index++];

  if (picker->stage != PICKER_STAGE_QUIETS) {
    return picked;
  }

  move_t *best = picked;
  move_t *candidate = picked + 1;
  move_t *end = picker->moves + picker->count;

  while (candidate != end) {
    if (candidate->score > best->score) {
      best = candidate;
    }

    ++candidate;
  }

  if (best != picked) {
    move_t swap = *picked;
    *picked = *best;
    *best = swap;
  }

  return picked;
}

static inline uint8_t move_picker_skip_duplicate(
  move_picker_t *picker,
  const move_t *move
)
{
  if (
    (picker->priority & PICKER_HAS_PV) &&
    moves_are_same(move, &picker->pv_move)
  ) {
    picker->priority &= ~PICKER_HAS_PV;
    return 1;
  }

  if (
    (picker->priority & PICKER_HAS_TT) &&
    moves_are_same(move, &picker->tt_move)
  ) {
    picker->priority &= ~PICKER_HAS_TT;
    return 1;
  }

  return 0;
}

void move_picker_init(
  move_picker_t *picker,
  move_t *moves,
  uint8_t capacity,
  const move_t *pv_move,
  const uint8_t has_pv_move,
  const move_t *tt_move,
  const uint8_t has_tt_move
)
{
  picker->moves = moves;
  picker->capacity = capacity;
  picker->count = 0;
  picker->index = 0;
  picker->stage = PICKER_STAGE_CAPTURES;
  picker->priority = 0;

  if (has_pv_move) {
    picker->pv_move = *pv_move;
    picker->priority |=
      PICKER_HAS_PV |
      PICKER_PV_PENDING;
  }

  if (
    has_tt_move &&
    (
      !has_pv_move ||
      !moves_are_same(pv_move, tt_move)
    )
  ) {
    picker->tt_move = *tt_move;
    picker->priority |=
      PICKER_HAS_TT |
      PICKER_TT_PENDING;
  }
}

uint8_t move_picker_next(
  move_picker_t *picker,
  move_t **move
)
{
  if (picker->priority & PICKER_PV_PENDING) {
    picker->priority &= ~PICKER_PV_PENDING;
    *move = &picker->pv_move;

    return MOVE_PICKER_MOVE;
  }

  if (picker->priority & PICKER_TT_PENDING) {
    picker->priority &= ~PICKER_TT_PENDING;
    *move = &picker->tt_move;

    return MOVE_PICKER_MOVE;
  }

  while (1) {
    while (picker->index == picker->count) {
      uint8_t generation_stage;

      switch (picker->stage) {
        case PICKER_STAGE_CAPTURES:
          generation_stage = GEN_CAPTURES;
          picker->stage = PICKER_STAGE_QUIETS;
          break;

        case PICKER_STAGE_QUIETS:
          generation_stage = GEN_QUIETS;
          picker->stage = PICKER_STAGE_DONE;
          break;

        case PICKER_STAGE_DONE:
          return MOVE_PICKER_DONE;

        default:
          return MOVE_PICKER_OVERFLOW;
      }

      picker->count = movegen_generate(
        picker->moves,
        picker->capacity,
        generation_stage
      );
      picker->index = 0;

      if (picker->count == MOVEGEN_OVERFLOW) {
        picker->count = 0;
        picker->stage = PICKER_STAGE_OVERFLOW;

        return MOVE_PICKER_OVERFLOW;
      }

      if (generation_stage == GEN_CAPTURES) {
        score_captures(
          picker->moves,
          picker->count
        );
      }
    }

    move_t *candidate = move_picker_pick(picker);

    if (move_picker_skip_duplicate(picker, candidate)) {
      continue;
    }

    *move = candidate;
    return MOVE_PICKER_MOVE;
  }
}

move_t *move_picker_end(const move_picker_t *picker)
{
  return picker->moves + picker->count;
}
