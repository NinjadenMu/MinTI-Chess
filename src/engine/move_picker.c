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

#define PICKER_HISTORY_MOVE_COUNT 6

enum {
  PICKER_STAGE_CAPTURES,
  PICKER_STAGE_KILLER_1,
  PICKER_STAGE_KILLER_2,
  PICKER_STAGE_QUIETS,
  PICKER_STAGE_DONE,
  PICKER_STAGE_OVERFLOW
};

// flags stored in picker's priority field
enum {
  PICKER_HAS_PV = 0x01,
  PICKER_HAS_TT = 0x02,
  PICKER_HAS_KILLER_1 = 0x04,
  PICKER_HAS_KILLER_2 = 0x08,
  PICKER_PV_PENDING = 0x10,
  PICKER_TT_PENDING = 0x20
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

static inline uint8_t ray_is_clear(
  uint8_t from,
  uint8_t to
)
{
  uint8_t *const board = BOARD;
  int8_t step =
    DELTA_STEP[DELTA_TABLE_INDEX(to - from)];
  uint8_t square = from + step;

  while (square != to) {
    if (board[square] != PIECE_EMPTY) {
      return 0;
    }

    square += step;
  }

  return 1;
}

static uint8_t killer_is_pseudolegal(const move_t *move)
{
  uint8_t *const board = BOARD;
  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t flags = move->flags;

  if (
    SQUARE_OFFBOARD(from) ||
    SQUARE_OFFBOARD(to)
  ) {
    return 0;
  }

  uint8_t side = POSITION_SIDE;
  uint8_t piece = board[from];

  if (
    !piece_is_friendly(piece, side) ||
    board[to] != PIECE_EMPTY
  ) {
    return 0;
  }

  if (
    flags != MF_QUIET &&
    flags != MF_DPUSH &&
    flags != MF_CASTLE
  ) {
    return 0;
  }

  uint8_t piece_type = PIECE_TYPE(piece);

  if (piece_type == PIECE_PAWN) {
    if (flags == MF_CASTLE) {
      return 0;
    }

    if (side == COLOR_WHITE) {
      if (flags == MF_DPUSH) {
        return
          SQUARE_RANK(from) == 1 &&
          to == from + 32 &&
          board[from + 16] == PIECE_EMPTY;
      }

      return
        SQUARE_RANK(to) != 7 &&
        to == from + 16;
    }

    if (flags == MF_DPUSH) {
      return
        SQUARE_RANK(from) == 6 &&
        from == to + 32 &&
        board[from - 16] == PIECE_EMPTY;
    }

    return
      SQUARE_RANK(to) != 0 &&
      from == to + 16;
  }

  uint8_t delta_attackers =
    DELTA_ATTACKERS[DELTA_TABLE_INDEX(to - from)];

  switch (piece_type) {
    case PIECE_KNIGHT:
      return
        flags == MF_QUIET &&
        (delta_attackers & ATK_KNIGHT) != 0;

    case PIECE_KING:
      if (flags == MF_QUIET) {
        return
          (delta_attackers & ATK_KING) != 0;
      }

      if (flags != MF_CASTLE) {
        return 0;
      }

      if (
        side == COLOR_WHITE &&
        from == SQUARE(4, 0)
      ) {
        if (to == SQUARE(6, 0)) {
          return
            (POSITION_CASTLING & CASTLE_WHITE_KING) &&
            board[SQUARE(5, 0)] == PIECE_EMPTY &&
            board[SQUARE(7, 0)] == WHITE_ROOK;
        }

        if (to == SQUARE(2, 0)) {
          return
            (POSITION_CASTLING & CASTLE_WHITE_QUEEN) &&
            board[SQUARE(3, 0)] == PIECE_EMPTY &&
            board[SQUARE(1, 0)] == PIECE_EMPTY &&
            board[SQUARE(0, 0)] == WHITE_ROOK;
        }

        return 0;
      }

      if (
        side == COLOR_BLACK &&
        from == SQUARE(4, 7)
      ) {
        if (to == SQUARE(6, 7)) {
          return
            (POSITION_CASTLING & CASTLE_BLACK_KING) &&
            board[SQUARE(5, 7)] == PIECE_EMPTY &&
            board[SQUARE(7, 7)] == BLACK_ROOK;
        }

        if (to == SQUARE(2, 7)) {
          return
            (POSITION_CASTLING & CASTLE_BLACK_QUEEN) &&
            board[SQUARE(3, 7)] == PIECE_EMPTY &&
            board[SQUARE(1, 7)] == PIECE_EMPTY &&
            board[SQUARE(0, 7)] == BLACK_ROOK;
        }
      }

      return 0;

    case PIECE_BISHOP:
      if (
        flags != MF_QUIET ||
        !(delta_attackers & ATK_DIAG)
      ) {
        return 0;
      }

      return ray_is_clear(from, to);

    case PIECE_ROOK:
      if (
        flags != MF_QUIET ||
        !(delta_attackers & ATK_ORTH)
      ) {
        return 0;
      }

      return ray_is_clear(from, to);

    case PIECE_QUEEN:
      if (
        flags != MF_QUIET ||
        !(delta_attackers & (ATK_DIAG | ATK_ORTH))
      ) {
        return 0;
      }

      return ray_is_clear(from, to);

    default:
      return 0;
  }
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

static void score_quiets(
  move_t *moves,
  uint8_t count
)
{
  uint8_t *const board = BOARD;
  move_t *end = moves + count;

  while (moves != end) {
    moves->score =
      HISTORY[board[moves->from]][moves->to];

    ++moves;
  }
}

static move_t *move_picker_pick(move_picker_t *picker)
{
  move_t *picked =
    &picker->moves[picker->index++];

  if (
    picker->stage != PICKER_STAGE_KILLER_1 &&
    (
      picker->stage != PICKER_STAGE_DONE ||
      picker->index > PICKER_HISTORY_MOVE_COUNT
    )
  ) {
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

  if (picker->stage != PICKER_STAGE_DONE) {
    // Only quiets can duplicate killers
    return 0;
  }

  if (
    (picker->priority & PICKER_HAS_KILLER_1) &&
    moves_are_same(move, &picker->killers[0])
  ) {
    picker->priority &= ~PICKER_HAS_KILLER_1;
    return 1;
  }

  if (
    (picker->priority & PICKER_HAS_KILLER_2) &&
    moves_are_same(move, &picker->killers[1])
  ) {
    picker->priority &= ~PICKER_HAS_KILLER_2;
    return 1;
  }

  return 0;
}

void move_picker_init(
  move_picker_t *picker,
  move_t *moves,
  uint8_t capacity,
  move_t *killers,
  const move_t *pv_move,
  const uint8_t has_pv_move,
  const move_t *tt_move,
  const uint8_t has_tt_move
)
{
  picker->moves = moves;
  picker->killers = killers;
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

  if (killers[0].from != SQUARE_NONE) {
    picker->priority |= PICKER_HAS_KILLER_1;
  }

  if (killers[1].from != SQUARE_NONE) {
    picker->priority |= PICKER_HAS_KILLER_2;
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
          picker->stage = PICKER_STAGE_KILLER_1;
          break;

        case PICKER_STAGE_KILLER_1:
          {
            move_t *killer = &picker->killers[0];

            picker->stage = PICKER_STAGE_KILLER_2;

            if (
              (picker->priority & PICKER_HAS_KILLER_1) &&
              (
                !(picker->priority & PICKER_HAS_PV) ||
                !moves_are_same(killer, &picker->pv_move)
              ) &&
              (
                !(picker->priority & PICKER_HAS_TT) ||
                !moves_are_same(killer, &picker->tt_move)
              ) &&
              killer_is_pseudolegal(killer)
            ) {
              *move = killer;
              return MOVE_PICKER_MOVE;
            }

            picker->priority &= ~PICKER_HAS_KILLER_1;
            continue;
          }

        case PICKER_STAGE_KILLER_2:
          {
            move_t *killer = &picker->killers[1];

            picker->stage = PICKER_STAGE_QUIETS;

            if (
              (picker->priority & PICKER_HAS_KILLER_2) &&
              (
                !(picker->priority & PICKER_HAS_PV) ||
                !moves_are_same(killer, &picker->pv_move)
              ) &&
              (
                !(picker->priority & PICKER_HAS_TT) ||
                !moves_are_same(killer, &picker->tt_move)
              ) &&
              (
                !(picker->priority & PICKER_HAS_KILLER_1) ||
                !moves_are_same(killer, &picker->killers[0])
              ) &&
              killer_is_pseudolegal(killer)
            ) {
              *move = killer;
              return MOVE_PICKER_MOVE;
            }

            picker->priority &= ~PICKER_HAS_KILLER_2;
            continue;
          }

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
      else {
        score_quiets(
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
