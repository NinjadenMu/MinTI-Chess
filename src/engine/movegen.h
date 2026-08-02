/**
 * @file movegen.h
 * 
 * Staged pseudo-legal move generation
 */

#ifndef MINTI_ENGINE_MOVEGEN_H
#define MINTI_ENGINE_MOVEGEN_H

#include <stdint.h>

#include "types.h"

/**
 * @brief Writes pseudolegal moves to *out
 * 
 * @param[out] out - pointer to start writing generated moves to
 * @param[in] capacity - maximum number of moves to write
 * @param[in] stage - move generation stage
 * 
 * @return number of moves written or `MOVEGEN_OVERFLOW` if `capacity` exceeded
 */
uint8_t movegen_generate(
  move_t *out,
  uint8_t capacity,
  uint8_t stage
);

#endif
