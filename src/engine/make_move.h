/**
 * @file make_move.h
 * 
 * Move making and unmaking
 */

#ifndef MINTI_ENGINE_MAKE_MOVE_H
#define MINTI_ENGINE_MAKE_MOVE_H

#include <stdint.h>

#include "hash.h"
#include "types.h"

 typedef struct {
  hash_key_t hash;
  uint8_t ep_square;
  uint8_t castling;
  uint8_t halfmove;
  uint8_t captured;
  uint8_t captured_square;
} undo_t;

/**
 * @brief Incrementally applies a pseudolegal move
 * 
 * @param[in] move - move to apply
 * @param[out] undo - writes info to undo move here
 */
void make_move(const move_t *move, undo_t *undo);

/**
 * @brief Restores the position from before a call to make_move
 *
 * `move` should have been the last move to be applied by `make_move`.
 *
 * @param[in] move - move being undone
 * @param[in] undo - state written by make_move
 */
void unmake_move(const move_t *move, const undo_t *undo);

#endif
