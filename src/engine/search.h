/**
 * @file search.h
 * 
 * The brain!
 */

#ifndef MINTI_ENGINE_SEARCH_H
#define MINTI_ENGINE_SEARCH_H

#include <stdint.h>

#include "evaluation.h"
#include "types.h"

enum {
  SEARCH_SCORE_DRAW = 0,
  SEARCH_SCORE_MATE = 30000, // larger than any possible non-mate eval
  SEARCH_SCORE_INFINITY = 31000 // larger than mate score + adjustments
};

typedef struct {
  eval_t score;
  uint24_t nodes;
  uint24_t transposition_hits;
  move_t best_move;
  uint8_t depth;
  uint8_t pv_length;
  uint8_t has_move;
} search_result_t;

/**
 * @brief Iterative deepening PVS search
 * @return 0 on success, nonzero otherwise
 */
uint8_t search_position(
  uint8_t max_depth,
  search_result_t *result
);

const move_t *get_principal_variation(void);

#endif
