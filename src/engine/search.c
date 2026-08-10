/**
 * @file search.c
 * 
 * The brain! (implementation of search.h)
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "../config.h"
#include "attack.h"
#include "evaluation.h"
#include "legality.h"
#include "make_move.h"
#include "move_picker.h"
#include "repetition.h"
#include "search.h"
#include "storage.h"
#include "types.h"

#define PV_TABLE_SIZE \
  (MAX_PLY * (MAX_PLY + 1) / 2)

static move_t pv_table[PV_TABLE_SIZE];
static uint8_t pv_length[MAX_PLY + 1];

static move_t previous_pv[MAX_PLY];
static uint8_t previous_pv_length;

static uint24_t search_nodes;
static uint8_t search_status;

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

static uint8_t available_move_capacity(move_t *base)
{
  uint24_t remaining =
    move_arena + MOVE_ARENA_CAPACITY - base;

  return remaining < MOVEGEN_OVERFLOW
    ? remaining
    : MOVEGEN_OVERFLOW - 1;
}

static void update_pv(
  uint8_t ply,
  move_t *pv_row,
  const move_t *child_row,
  const move_t *move
)
{
  uint8_t child_length = pv_length[ply + 1];

  pv_row[0] = *move;

  for (uint8_t index = 0; index < child_length; ++index) {
    pv_row[index + 1] = child_row[index];
  }

  pv_length[ply] = child_length + 1;
}

static eval_t pvs(
  uint8_t depth,
  uint8_t ply,
  eval_t alpha,
  eval_t beta,
  move_t *pv_row,
  uint8_t follows_previous_pv
)
{
  ++search_nodes;
  pv_length[ply] = 0;

  if (
    POSITION_HALFMOVE >= 100 ||
    repetition_search_is_threefold(ply)
  ) {
    return SEARCH_SCORE_DRAW;
  }

  if (depth == 0 || ply == MAX_PLY) {
    return evaluate_position();
  }

  king_info_t *king_info = &king_info_stack[ply];

  king_scan(POSITION_SIDE, king_info);

  uint8_t has_preferred = 
    follows_previous_pv &&
    ply < previous_pv_length;
  const move_t *preferred = has_preferred ? &previous_pv[ply] : 0;

  move_picker_t picker;
  move_t *move_base = move_list_base[ply];

  move_picker_init(
    &picker,
    move_base,
    available_move_capacity(move_base),
    preferred,
    has_preferred
  );

  move_t *child_row =
    pv_row + (MAX_PLY - ply);

  uint8_t legal_moves = 0;
  uint8_t first_move = 1;
  uint8_t picker_status;
  move_t *move;

  while (
    (picker_status = move_picker_next(&picker, &move)) ==
    MOVE_PICKER_MOVE
  ) {
    if (!move_is_legal(move, king_info)) {
      continue;
    }

    ++legal_moves;

    uint8_t child_follows_previous_pv =
      has_preferred &&
      moves_are_same(move, preferred);

    move_list_base[ply + 1] =
      move_picker_end(&picker);

    make_move(move, &undo_stack[ply]);

    eval_t score;

    if (first_move) {
      score = -pvs(
        depth - 1,
        ply + 1,
        -beta,
        -alpha,
        child_row,
        child_follows_previous_pv
      );
    }
    else {
      score = -pvs(
        depth - 1,
        ply + 1,
        -alpha - 1,
        -alpha,
        child_row,
        child_follows_previous_pv
      );

      if (
        search_status == 0 &&
        score > alpha &&
        score < beta
      ) {
        // if zero-window search fails
        score = -pvs(
          depth - 1,
          ply + 1,
          -beta,
          -alpha,
          child_row,
          child_follows_previous_pv
        );
      }
    }

    unmake_move(move, &undo_stack[ply]);

    if (search_status != 0) {
      return SEARCH_SCORE_DRAW; // placeholder val gets thrown away
    }

    first_move = 0;

    if (score <= alpha) {
      continue;
    }

    alpha = score;
    update_pv(
      ply,
      pv_row,
      child_row,
      move
    );

    if (alpha >= beta) {
      break;
    }
  }

  if (picker_status == MOVE_PICKER_OVERFLOW) {
    search_status = 1;
    return SEARCH_SCORE_DRAW;
  }

  if (legal_moves == 0) {
    return king_info->n_checkers != 0
      ? -SEARCH_SCORE_MATE + ply
      : SEARCH_SCORE_DRAW;
  }

  return alpha;
}

static void save_completed_pv(void)
{
  previous_pv_length = pv_length[0];

  for (
    uint8_t index = 0;
    index < previous_pv_length;
    ++index
  ) {
    previous_pv[index] = pv_table[index];
  }
}

uint8_t search_position(
  uint8_t max_depth,
  search_result_t *result
)
{
  search_nodes = 0;
  search_status = 0;
  previous_pv_length = 0;
  move_list_base[0] = move_arena;

  result->score = evaluate_position();
  result->nodes = 0;
  result->best_move.from = SQUARE_NONE;
  result->best_move.to = SQUARE_NONE;
  result->best_move.flags = 0;
  result->best_move.score = 0;
  result->depth = 0;
  result->pv_length = 0;
  result->has_move = 0;

  if (max_depth > MAX_PLY) {
    max_depth = MAX_PLY;
  }

  for (
    uint8_t depth = 1;
    depth <= max_depth;
    ++depth
  ) {
    eval_t score = pvs(
      depth,
      0,
      -SEARCH_SCORE_INFINITY,
      SEARCH_SCORE_INFINITY,
      pv_table,
      previous_pv_length != 0
    );

    if (search_status != 0) {
      break;
    }

    save_completed_pv();

    result->score = score;
    result->depth = depth;
    result->pv_length = previous_pv_length;
    result->has_move = previous_pv_length != 0;

    if (result->has_move) {
      result->best_move = previous_pv[0];
    }
  }

  result->nodes = search_nodes;

  return search_status;
}

const move_t *get_principal_variation(void) {
  return previous_pv;
}
