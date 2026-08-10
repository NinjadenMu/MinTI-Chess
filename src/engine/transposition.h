/**
 * @file transposition.h
 * 
 * Transposition table
 */

#ifndef MINTI_ENGINE_TRANSPOSITION_H
#define MINTI_ENGINE_TRANSPOSITION_H

#include <stdint.h>

#include "evaluation.h"
#include "types.h"

enum {
  TT_BOUND_NONE = 0,
  TT_BOUND_UPPER = 1,
  TT_BOUND_LOWER = 2,
  TT_BOUND_EXACT = 3
};

typedef struct {
  eval_t score;
  move_t move;
  uint8_t depth;
  uint8_t bound;
  uint8_t hit;
  uint8_t has_move;
} tt_probe_t;

/**
 * @brief Clears all table entries
 */
void tt_clear(void);

/**
 * @brief Probes table for current position
 * 
 * `result` score is ply-adjusted.
 */
void tt_probe(
  uint8_t ply,
  tt_probe_t *result
);

/**
 * @brief Stores search result in table
 * 
 * `move` ignored if `has_move` is 0.
 */
void tt_store(
  uint8_t depth,
  uint8_t ply,
  eval_t score,
  uint8_t bound,
  const move_t *move,
  uint8_t has_move
);

#endif
