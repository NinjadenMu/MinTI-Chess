/**
 * @file search.c
 * 
 * The brain! (implementation of search.h)
 */

#include "debug.h"
#include <stdint.h>
#include <string.h>

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
#include "transposition.h"
#include "types.h"

#define PV_TABLE_SIZE \
  (MAX_PLY * (MAX_PLY + 1) / 2)

#define QUIESCENCE_DELTA_MARGIN 200

// once quiescence reaches this, it will stop as soon as it's not in check
#define QUIESCENCE_SOFT_MAX_DEPTH 8

#define NULL_MOVE_MIN_DEPTH 3
#define NULL_MOVE_REDUCTION 2
#define ASPIRATION_WINDOW 50

static const uint16_t delta_piece_values[7] = {
  0, 100, 320, 0, 330, 500, 950
};

static move_t pv_table[PV_TABLE_SIZE];
static uint8_t pv_length[MAX_PLY + 1];

static move_t previous_pv[MAX_PLY];
static uint8_t previous_pv_length;

static move_t killer_moves[MAX_PLY][2];

static uint24_t search_nodes;
static uint24_t transposition_hits;
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

static void update_quiet_heuristics(
  uint8_t depth,
  uint8_t ply,
  const move_t *move
)
{
  if (move->flags & (MF_CAPTURE | MF_PROMO)) {
    return;
  }

  uint8_t piece = BOARD[move->from];
  uint8_t *history =
    &HISTORY[piece][move->to];
  uint8_t previous = *history;
  uint8_t updated = previous + depth;

  *history = updated < previous
    ? 0xff
    : updated;

  move_t *killers = killer_moves[ply];

  if (moves_are_same(move, &killers[0])) {
    return;
  }

  move_t replacement = *move;

  killers[1] = killers[0];
  killers[0] = replacement;
}

static uint8_t available_move_capacity(move_t *base)
{
  uint24_t remaining =
    move_arena + MOVE_ARENA_CAPACITY - base;

  return remaining < MOVEGEN_OVERFLOW
    ? remaining
    : MOVEGEN_OVERFLOW - 1;
}

static inline uint16_t delta_capture_value(
  const move_t *move
)
{
  if (move->flags & MF_EP) {
    return delta_piece_values[PIECE_PAWN];
  }

  return delta_piece_values[
    PIECE_TYPE(BOARD[move->to])
  ];
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

static eval_t quiescence(
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

  if (ply == MAX_PLY) {
    return evaluate_position();
  }

  king_info_t *king_info = &king_info_stack[ply];

  king_scan(POSITION_SIDE, king_info);

  uint8_t in_check = king_info->n_checkers != 0;
  eval_t stand_pat = -SEARCH_SCORE_INFINITY;

  if (!in_check) {
    stand_pat = evaluate_position();

    if (depth == 0) {
      return stand_pat;
    }

    if (stand_pat >= beta) {
      return stand_pat;
    }

    if (stand_pat > alpha) {
      alpha = stand_pat;
    }
  }

  uint8_t has_pv_move =
    follows_previous_pv &&
    ply < previous_pv_length;
  const move_t *pv_move =
    has_pv_move ? &previous_pv[ply] : 0;

  if (
    has_pv_move &&
    !in_check &&
    !(pv_move->flags & (MF_CAPTURE | MF_PROMO))
  ) {
    has_pv_move = 0;
  }

  move_picker_t picker;
  move_t *move_base = move_list_base[ply];

  if (in_check) {
    move_picker_init(
      &picker,
      move_base,
      available_move_capacity(move_base),
      killer_moves[ply],
      pv_move,
      has_pv_move,
      0,
      0
    );
  }
  else {
    move_picker_init_tactical(
      &picker,
      move_base,
      available_move_capacity(move_base),
      pv_move,
      has_pv_move
    );
  }

  move_t *child_row =
    pv_row + (MAX_PLY - ply);

  uint8_t legal_moves = 0;
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
      has_pv_move &&
      moves_are_same(move, pv_move);

    move_list_base[ply + 1] =
      move_picker_end(&picker);

    uint8_t delta_prune =
      !in_check &&
      !(move->flags & MF_PROMO) &&
      stand_pat +
        delta_capture_value(move) +
        QUIESCENCE_DELTA_MARGIN <
      alpha;

    make_move(move, &undo_stack[ply]);

    if (
      delta_prune &&
      !square_is_attacked(
        POSITION_KING_SQUARE[
          COLOR_INDEX(POSITION_SIDE)
        ],
        OPPOSITE_COLOR(POSITION_SIDE)
      )
    ) {
      unmake_move(move, &undo_stack[ply]);
      continue;
    }

    eval_t score = -quiescence(
      depth == 0 ? 0 : depth - 1, // prevent nasty underflow bug
      ply + 1,
      -beta,
      -alpha,
      child_row,
      child_follows_previous_pv
    );

    unmake_move(move, &undo_stack[ply]);

    if (search_status != 0) {
      return SEARCH_SCORE_DRAW; // placeholder value, gets thrown away
    }

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

  if (in_check && legal_moves == 0) {
    return -SEARCH_SCORE_MATE + ply;
  }

  return alpha;
}

static eval_t pvs(
  uint8_t depth,
  uint8_t ply,
  eval_t alpha,
  eval_t beta,
  move_t *pv_row,
  uint8_t follows_previous_pv,
  uint8_t can_null
)
{
  if (depth == 0) {
    return quiescence(
      QUIESCENCE_SOFT_MAX_DEPTH,
      ply,
      alpha,
      beta,
      pv_row,
      follows_previous_pv
    );
  }

  ++search_nodes;
  pv_length[ply] = 0;

  if (
    POSITION_HALFMOVE >= 100 ||
    repetition_search_is_threefold(ply)
  ) {
    return SEARCH_SCORE_DRAW;
  }

  if (ply == MAX_PLY) {
    return evaluate_position();
  }

  eval_t original_alpha = alpha;
  uint8_t pv_node = beta - alpha > 1;

  /*
   * Technically should incorporate threefold, but threefold is very hard to 
   * check (especially with the current table design), and the advantages 
   * of a transposition table outweigh edge cases about threefold
   */
  uint8_t tt_score_allowed =
    POSITION_HALFMOVE + depth < 100;

  tt_probe_t tt;
  tt_probe(ply, &tt);

  if (tt.hit) {
    ++transposition_hits;

    if (
      tt_score_allowed &&
      !pv_node &&
      tt.depth >= depth
    ) {
      if (tt.bound == TT_BOUND_EXACT) {
        return tt.score;
      }

      if (
        tt.bound == TT_BOUND_LOWER &&
        tt.score >= beta
      ) {
        return tt.score;
      }

      if (
        tt.bound == TT_BOUND_UPPER &&
        tt.score <= alpha
      ) {
        return tt.score;
      }
    }
  }

  king_info_t *king_info = &king_info_stack[ply];
  king_scan(POSITION_SIDE, king_info);

  move_t *move_base = move_list_base[ply];
  move_t *child_row =
    pv_row + (MAX_PLY - ply);

  if (
    can_null &&
    !pv_node &&
    depth >= NULL_MOVE_MIN_DEPTH &&
    king_info->n_checkers == 0 &&
    beta > -SEARCH_SCORE_MATE + MAX_PLY &&
    EVAL_NONPAWN_MATERIAL[
      COLOR_INDEX(POSITION_SIDE)
    ] != 0
  ) {
    eval_t static_score = evaluate_position();

    if (static_score >= beta) {
      // only try null move if beta cutoff is plausible

      move_list_base[ply + 1] = move_base;

      make_null_move(&undo_stack[ply]);

      // this silliness with the casting is due to what I believe to be a 
      // miscompile related to 24-bit integers.
      // Issue filed here:
      // https://github.com/CE-Programming/llvm-project/issues/52
      // Will revisit.
      eval_t null_alpha = -beta;
      eval_t null_beta = (int16_t)null_alpha + 1;

      eval_t score = -pvs(
        depth - NULL_MOVE_REDUCTION - 1,
        ply + 1,
        null_alpha,
        null_beta,
        child_row,
        0,
        0
      );

      unmake_null_move(&undo_stack[ply]);

      if (search_status != 0) {
        return SEARCH_SCORE_DRAW;
      }

      if (score >= beta) {
        return beta;
      }
    }
  }

  uint8_t has_pv_move =
    follows_previous_pv &&
    ply < previous_pv_length;
  const move_t *pv_move =
    has_pv_move ? &previous_pv[ply] : 0;

  uint8_t has_tt_move =
    tt.hit &&
    tt.has_move;
  const move_t *tt_move =
    has_tt_move ? &tt.move : 0;

  move_picker_t picker;

  move_picker_init(
    &picker,
    move_base,
    available_move_capacity(move_base),
    killer_moves[ply],
    pv_move,
    has_pv_move,
    tt_move,
    has_tt_move
  );

  move_t best_move;
  eval_t best_score = -SEARCH_SCORE_INFINITY;

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
      has_pv_move &&
      moves_are_same(move, pv_move);

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
        child_follows_previous_pv,
        1
      );
    }
    else {
      score = -pvs(
        depth - 1,
        ply + 1,
        -alpha - 1,
        -alpha,
        child_row,
        child_follows_previous_pv,
        1
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
          child_follows_previous_pv,
          1
        );
      }
    }

    unmake_move(move, &undo_stack[ply]);

    if (search_status != 0) {
      return SEARCH_SCORE_DRAW; // placeholder val gets thrown away
    }

    first_move = 0;

    if (score > best_score) {
      best_score = score;
      best_move = *move;
    }

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
      update_quiet_heuristics(
        depth,
        ply,
        move
      );
      break;
    }
  }

  if (picker_status == MOVE_PICKER_OVERFLOW) {
    search_status = 1;
    return SEARCH_SCORE_DRAW;
  }

  eval_t result;
  if (legal_moves == 0) {
    result = king_info->n_checkers != 0
      ? -SEARCH_SCORE_MATE + ply
      : SEARCH_SCORE_DRAW;
  }
  else {
    result = alpha;
  }

  if (tt_score_allowed) {
    uint8_t bound;

    if (result <= original_alpha) {
      bound = TT_BOUND_UPPER;
    }
    else if (result >= beta) {
      bound = TT_BOUND_LOWER;
    }
    else {
      bound = TT_BOUND_EXACT;
    }

    uint8_t has_best_move = legal_moves > 0 ? 1 : 0;
    tt_store(
      depth,
      ply,
      result,
      bound,
      has_best_move ? &best_move : 0,
      has_best_move
    );
  }

  return result;
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

static void age_history(void)
{
  uint8_t *value = HISTORY[0];
  uint8_t *end = value + CE_SIZE_HISTORY;

  while (value != end) {
    *value >>= 1;
    ++value;
  }
}

uint8_t search_position(
  uint8_t max_depth,
  search_result_t *result
)
{
  tt_clear();
  memset(HISTORY, 0, CE_SIZE_HISTORY);

  for (uint8_t ply = 0; ply < MAX_PLY; ++ply) {
    killer_moves[ply][0].from = SQUARE_NONE;
    killer_moves[ply][1].from = SQUARE_NONE;
  }
  
  search_nodes = 0;
  transposition_hits = 0;
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
    age_history();

    eval_t alpha = -SEARCH_SCORE_INFINITY;
    eval_t beta = SEARCH_SCORE_INFINITY;
    if (depth > 2) {
      alpha = result->score - ASPIRATION_WINDOW;
      beta = result->score + ASPIRATION_WINDOW;
    }

    eval_t score = pvs(
      depth,
      0,
      alpha,
      beta,
      pv_table,
      previous_pv_length != 0,
      1
    );

    if (search_status != 0) {
      break;
    }

    if (
      depth > 2 &&
      (score <= alpha || score >= beta)
    ) {
      // retry if aspiration window failed
      score = pvs(
        depth,
        0,
        -SEARCH_SCORE_INFINITY,
        SEARCH_SCORE_INFINITY,
        pv_table,
        previous_pv_length != 0,
        1
      );
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
  result->transposition_hits = transposition_hits;

  return search_status;
}

const move_t *get_principal_variation(void) {
  return previous_pv;
}
