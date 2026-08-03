/**
 * @file attack.h
 * 
 * Attack, check, pin detection for speeding up move generation and legality 
 * checking
 */

#ifndef MINTI_ENGINE_ATTACK_H
#define MINTI_ENGINE_ATTACK_H

#include <stdint.h>

#include "types.h"

/**
 * @brief Check and pin information for king
 * 
 * checker_sq and checker_dir only relevant if there's one checker,
 * since with double checks, only king moves are legal
 */
typedef struct {
  uint8_t n_checkers; // max = 2
  uint8_t checker_sq;
  int8_t checker_dir;

  uint8_t n_pinned;
  uint8_t pinned_sq[8];
  int8_t pinned_dir[8];
} king_info_t;

/**
 * @brief Tests whether a square is being attacked
 */
uint8_t square_is_attacked(
  uint8_t square,
  uint8_t attacking_side
);

/**
 * @brief Finds checks and pins against one side's king
 * 
 * @param[in] side - side whose king should be "scanned"
 * @param[out] info - destination for check and pin info
 */
void king_scan(uint8_t side, king_info_t *info);

#endif