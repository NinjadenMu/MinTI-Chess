/**
 * @file evaluation.h
 *
 * Incremental static evaluation
 */

#ifndef MINTI_ENGINE_EVALUATION_H
#define MINTI_ENGINE_EVALUATION_H

#include <stdint.h>

#include "types.h"

typedef int24_t eval_t;

/**
 * @brief Initializes piece-square tables and evaluation state
 *
 * Must be called only after entering graphx 8-bpp single-buffer mode, because
 * initialization writes into the unused second framebuffer.
 */
void evaluation_init(void);

/**
 * @brief Clears incrementally maintained evaluation state
 */
void evaluation_clear(void);

/*
 * Low-level operations used by position.c.
 * 
 * These don't read board state
 */
void evaluation_add_piece(
  uint8_t piece,
  uint8_t square
);

void evaluation_remove_piece(
  uint8_t piece,
  uint8_t square
);

void evaluation_move_piece(
  uint8_t piece,
  uint8_t from,
  uint8_t to
);

/*
 * Hooks used by make_move.c
 * 
 * These don't read board state
 */
void evaluation_make_move(
  const move_t *move,
  uint8_t moving_piece,
  uint8_t placed_piece,
  uint8_t captured_piece,
  uint8_t captured_square
);

void evaluation_unmake_move(
  const move_t *move,
  uint8_t moving_piece,
  uint8_t placed_piece,
  uint8_t captured_piece,
  uint8_t captured_square
);

/**
 * @brief Evaluates the position from the side-to-move's perspective
 */
eval_t evaluate_position(void);

#endif
