/**
 * @file legality.c
 * 
 * Implementation of legality.h
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "attack.h"
#include "legality.h"
#include "make_move.h"
#include "types.h"

/*
 * En passant is complicated to check (since it moves a piece and removes a 
 * a piece on a different square), and is fairly rare.  Therefore, 
 * it makes sense to just do make-test-unmake instead of something clever.
 * 
 * We can use a single global undo object since validation of a move happens 
 * before descending ply.  
 */
static undo_t ep_undo;

static uint8_t en_passant_is_legal(const move_t *move)
{
  uint8_t side = PIECE_COLOR(BOARD[move->from]);
  uint8_t enemy = OPPOSITE_COLOR(side);
  uint8_t king_square = KING_SQUARE[COLOR_INDEX(side)];

  make_move(move, &ep_undo);

  uint8_t attacked = square_is_attacked(king_square, enemy);

  unmake_move(move, &ep_undo);

  return !attacked;
}

static inline uint8_t king_move_is_legal(
  const move_t *move,
  const king_info_t *info,
  uint8_t king
)
{
  uint8_t *const board = BOARD;
  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t enemy = OPPOSITE_COLOR(PIECE_COLOR(king));

  if (move->flags & MF_CASTLE) {
    if (info->n_checkers != 0) {
      return 0;
    }

    uint8_t through = (uint8_t)(from + to) >> 1; // clever little trick 

    // clear the king's origin since it would otherwise act as a blocker
    board[from] = PIECE_EMPTY;

    uint8_t attacked = square_is_attacked(through, enemy);

    if (!attacked) {
      attacked = square_is_attacked(to, enemy);
    }

    board[from] = king;

    return !attacked;
  }

  board[from] = PIECE_EMPTY;

  uint8_t attacked = square_is_attacked(to, enemy);

  board[from] = king;

  return !attacked;
}

uint8_t move_is_legal(
  const move_t *move,
  const king_info_t *info
)
{
  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t piece = BOARD[from];

  if (PIECE_TYPE(piece) == PIECE_KING) {
    return king_move_is_legal(move, info, piece);
  }

  if (move->flags & MF_EP) {
    return en_passant_is_legal(move);
  }

  // the king must move for a double check
  if (info->n_checkers > 1) {
    return 0;
  }

  /*
   * Pinned pieces can only move along the pin line, except for knights, which 
   * can't move at all (since they always leave the pin line)
   */
  for (uint8_t index = 0; index < info->n_pinned; ++index) {
    if (info->pinned_sq[index] == from) {
      int8_t pin_direction = info->pinned_dir[index];
      int8_t move_direction =
        DELTA_STEP[DELTA_TABLE_INDEX(to - from)];

      if (
        move_direction != pin_direction &&
        move_direction != -pin_direction
      ) {
        return 0;
      }

      break;
    }
  }

  if (info->n_checkers == 0) {
    return 1;
  }

  // at this point, there's at most one checker, so capturing it is legal
  if (to == info->checker_sq) {
    return 1;
  }

  // direct checks can't be blocked
  if (info->checker_dir == 0) {
    return 0;
  }

  uint8_t king_square =
    KING_SQUARE[COLOR_INDEX(PIECE_COLOR(piece))];

  // blockers should be along the direction of the check
  if (
    DELTA_STEP[DELTA_TABLE_INDEX(to - king_square)] !=
    info->checker_dir
  ) {
    return 0;
  }

  return
    DELTA_STEP[DELTA_TABLE_INDEX(info->checker_sq - to)] ==
    info->checker_dir; // blockers must be between checker and king
}
