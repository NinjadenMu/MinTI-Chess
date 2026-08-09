/**
 * @file move_picker.h
 * 
 * Ordered pseudo-legal move picking for search
 */

#ifndef MINTI_ENGINE_MOVE_PICKER_H
#define MINTI_ENGINE_MOVE_PICKER_H

#include <stdint.h>

#include "types.h"

enum {
  MOVE_PICKER_DONE = 0,
  MOVE_PICKER_MOVE = 1,
  MOVE_PICKER_OVERFLOW = MOVEGEN_OVERFLOW
};

typedef struct {
  move_t *moves;
  move_t preferred;
  uint8_t capacity;
  uint8_t count;
  uint8_t index;
  uint8_t stage;
  uint8_t has_preferred;
  uint8_t preferred_pending;
} move_picker_t;

/**
 * @brief Initializes a move picker object
 * 
 * @param[out] picker - picker object to initialize
 * @param[in] moves - buffer for current stage's generated moves
 * @param[in] capacity - number of moves available in buffer
 * @param[in] preferred - address of preferred move
 * @param[in] has_preferred - preferred is used if 1, else preferred is ignored
 */
void move_picker_init(
  move_picker_t *picker,
  move_t *moves,
  uint8_t capacity,
  const move_t *preferred,
  uint8_t has_preferred
);

/**
 * @brief Returns next pseudo-legal move
 * 
 * @param[in] picker - picker object
 * @param[out] move - address to write picked pseudo-legal move
 */
uint8_t move_picker_next(
  move_picker_t *picker,
  move_t ** move
);

/**
 * @brief Returns the first address after current stage's move list
 */
move_t *move_picker_end(const move_picker_t *picker);

#endif
