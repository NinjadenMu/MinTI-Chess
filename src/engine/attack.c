/**
 * @file attack.c
 * 
 * Implementation of attack.h
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "attack.h"
#include "types.h"

uint8_t square_is_attacked(
  uint8_t square,
  uint8_t attacking_side
)
{
  uint8_t *const board = BOARD;
  uint8_t attacker_square;
  uint8_t piece;

  uint8_t pawn = attacking_side | PIECE_PAWN;
  uint8_t knight = attacking_side | PIECE_KNIGHT;
  uint8_t king = attacking_side | PIECE_KING;
  uint8_t bishop = attacking_side | PIECE_BISHOP;
  uint8_t rook = attacking_side | PIECE_ROOK;
  uint8_t queen = attacking_side | PIECE_QUEEN;

#define PROBE_DIRECT_ATTACKER(delta_, attacker_)                               \
  do {                                                                         \
    attacker_square = square + (delta_);                                       \
                                                                               \
    if (                                                                       \
      !SQUARE_OFFBOARD(attacker_square) &&                                     \
      board[attacker_square] == (attacker_)                                    \
    ) {                                                                        \
      return 1;                                                                \
    }                                                                          \
  } while (0)

#define PROBE_RAY(delta_, slider_)                                             \
  do {                                                                         \
    attacker_square = square;                                                  \
                                                                               \
    while (1) {                                                                \
      attacker_square = attacker_square + (delta_);                            \
                                                                               \
      if (SQUARE_OFFBOARD(attacker_square)) {                                  \
        break;                                                                 \
      }                                                                        \
                                                                               \
      piece = board[attacker_square];                                          \
                                                                               \
      if (piece == PIECE_EMPTY) {                                              \
        continue;                                                              \
      }                                                                        \
                                                                               \
      if (piece == (slider_) || piece == queen) {                              \
        return 1;                                                              \
      }                                                                        \
                                                                               \
      break;                                                                   \
    }                                                                          \
  } while (0)

  if (attacking_side == COLOR_WHITE) {
    PROBE_DIRECT_ATTACKER(-15, pawn);
    PROBE_DIRECT_ATTACKER(-17, pawn);
  }
  else {
    PROBE_DIRECT_ATTACKER(15, pawn);
    PROBE_DIRECT_ATTACKER(17, pawn);
  }

  PROBE_DIRECT_ATTACKER(-33, knight);
  PROBE_DIRECT_ATTACKER(-31, knight);
  PROBE_DIRECT_ATTACKER(-18, knight);
  PROBE_DIRECT_ATTACKER(-14, knight);
  PROBE_DIRECT_ATTACKER(14, knight);
  PROBE_DIRECT_ATTACKER(18, knight);
  PROBE_DIRECT_ATTACKER(31, knight);
  PROBE_DIRECT_ATTACKER(33, knight);

  /*
   * This function is used for validating moves, so we have to check the 
   * opposing king
   */
  PROBE_DIRECT_ATTACKER(-17, king);
  PROBE_DIRECT_ATTACKER(-16, king);
  PROBE_DIRECT_ATTACKER(-15, king);
  PROBE_DIRECT_ATTACKER(-1, king);
  PROBE_DIRECT_ATTACKER(1, king);
  PROBE_DIRECT_ATTACKER(15, king);
  PROBE_DIRECT_ATTACKER(16, king);
  PROBE_DIRECT_ATTACKER(17, king);

  PROBE_RAY(15, bishop);
  PROBE_RAY(17, bishop);
  PROBE_RAY(-15, bishop);
  PROBE_RAY(-17, bishop);

  PROBE_RAY(1, rook);
  PROBE_RAY(-1, rook);
  PROBE_RAY(16, rook);
  PROBE_RAY(-16, rook);

#undef PROBE_RAY
#undef PROBE_DIRECT_ATTACKER

  return 0;
}

/**
 * @brief records first checker information
 * @return 0 for first checker, 1 afterwards
 */
static inline uint8_t record_checker(
  king_info_t *info,
  uint8_t checker_square,
  int8_t checker_direction
)
{
  if (info->n_checkers == 0) {
    info->n_checkers = 1;
    info->checker_sq = checker_square;
    info->checker_dir = checker_direction;

    return 0;
  }

  info->n_checkers = 2;
  return 1;
}

/**
 * @brief scans ray outward from king for checkers and pinned pieces
 * @return 1 if second checker found, 0 otherwise
 */
static inline uint8_t scan_king_ray(
  uint8_t king_square,
  uint8_t side,
  int8_t direction,
  uint8_t slider_type,
  king_info_t *info
)
{
  uint8_t *const board = BOARD;
  uint8_t square = king_square;
  uint8_t pin_candidate = SQUARE_NONE;

  while (1) {
    uint8_t piece;
    uint8_t type;

    square = square + direction;

    if (SQUARE_OFFBOARD(square)) {
      return 0;
    }

    piece = board[square];

    if (piece == PIECE_EMPTY) {
      continue;
    }

    if (PIECE_COLOR(piece) == side) {
      if (pin_candidate != SQUARE_NONE) {
        return 0;
      }

      pin_candidate = square;
      continue;
    }

    type = PIECE_TYPE(piece);

    if (type != slider_type && type != PIECE_QUEEN) {
      return 0;
    }

    if (pin_candidate == SQUARE_NONE) {
      return record_checker(info, square, direction);
    }

    if (info->n_pinned < 8) {
      uint8_t index = info->n_pinned;

      info->pinned_sq[index] = pin_candidate;
      info->pinned_dir[index] = direction;
      info->n_pinned = index + 1;
    }

    return 0;
  }
}

void king_scan(uint8_t side, king_info_t *info)
{
  uint8_t *const board = BOARD;
  uint8_t enemy = OPPOSITE_COLOR(side);
  uint8_t king_square = KING_SQUARE[COLOR_INDEX(side)];
  uint8_t attacker_square;

  uint8_t enemy_pawn = enemy | PIECE_PAWN;
  uint8_t enemy_knight = enemy | PIECE_KNIGHT;
  uint8_t enemy_king = enemy | PIECE_KING;

  info->n_checkers = 0;
  info->checker_sq = SQUARE_NONE;
  info->checker_dir = 0;
  info->n_pinned = 0;

  if (scan_king_ray(
    king_square,
    side,
    15,
    PIECE_BISHOP,
    info
  )) {
    /*
     * This means there's more than 1 checker
     * We can immediately return, since we no longer care about pinned pieces 
     * because a king move is forced in double check
     */
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    17,
    PIECE_BISHOP,
    info
  )) {
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    -15,
    PIECE_BISHOP,
    info
  )) {
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    -17,
    PIECE_BISHOP,
    info
  )) {
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    1,
    PIECE_ROOK,
    info
  )) {
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    -1,
    PIECE_ROOK,
    info
  )) {
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    16,
    PIECE_ROOK,
    info
  )) {
    return;
  }

  if (scan_king_ray(
    king_square,
    side,
    -16,
    PIECE_ROOK,
    info
  )) {
    return;
  }

#define PROBE_DIRECT_CHECKER(delta_, attacker_)                               \
  do {                                                                         \
    attacker_square = king_square + (delta_);                                  \
                                                                               \
    if (                                                                       \
      !SQUARE_OFFBOARD(attacker_square) &&                                     \
      board[attacker_square] == (attacker_) &&                                 \
      record_checker(info, attacker_square, 0)                                 \
    ) {                                                                        \
      return;                                                                  \
    }                                                                          \
  } while (0)

  if (enemy == COLOR_WHITE) {
    PROBE_DIRECT_CHECKER(-15, enemy_pawn);
    PROBE_DIRECT_CHECKER(-17, enemy_pawn);
  }
  else {
    PROBE_DIRECT_CHECKER(15, enemy_pawn);
    PROBE_DIRECT_CHECKER(17, enemy_pawn);
  }

  PROBE_DIRECT_CHECKER(-33, enemy_knight);
  PROBE_DIRECT_CHECKER(-31, enemy_knight);
  PROBE_DIRECT_CHECKER(-18, enemy_knight);
  PROBE_DIRECT_CHECKER(-14, enemy_knight);
  PROBE_DIRECT_CHECKER(14, enemy_knight);
  PROBE_DIRECT_CHECKER(18, enemy_knight);
  PROBE_DIRECT_CHECKER(31, enemy_knight);
  PROBE_DIRECT_CHECKER(33, enemy_knight);

  PROBE_DIRECT_CHECKER(-17, enemy_king);
  PROBE_DIRECT_CHECKER(-16, enemy_king);
  PROBE_DIRECT_CHECKER(-15, enemy_king);
  PROBE_DIRECT_CHECKER(-1, enemy_king);
  PROBE_DIRECT_CHECKER(1, enemy_king);
  PROBE_DIRECT_CHECKER(15, enemy_king);
  PROBE_DIRECT_CHECKER(16, enemy_king);
  PROBE_DIRECT_CHECKER(17, enemy_king);

#undef PROBE_DIRECT_CHECKER
}