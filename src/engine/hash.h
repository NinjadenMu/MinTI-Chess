/**
 * @file hash.h
 *
 * Incremental additive position hashing
 */

#ifndef MINTI_ENGINE_HASH_H
#define MINTI_ENGINE_HASH_H

#include <stdint.h>

#include "../ce/memory_map.h"
#include "types.h"

/*
 * 2 separate keys are used because I find 3-fold validation with 24-bit keys 
 * a bit sketchy.  part[0] should be used for indexing, part[1] can be used 
 * for verification.
 */
typedef struct {
  uint24_t part[2];
} hash_key_t;

#define HASH \
  (*(hash_key_t *)CE_ADDR_HASH_KEY)

#define HASH_ADDR \
  ((hash_key_t *)CE_ADDR_HASH_KEY)

/**
 * @brief Initializes random tables needed for caching
 */
void hash_init(void);

/**
 * @brief Clears the incrementally maintained key
 */
void hash_clear(void);

/**
 * @brief Recalculates key from scratch using current position
 */
void hash_rebuild(void);

/*
 * Low-level hooks. These don't read board state.
 */
void hash_add_piece(
  uint8_t piece,
  uint8_t square
);

void hash_remove_piece(
  uint8_t piece,
  uint8_t square
);

void hash_move_piece(
  uint8_t piece,
  uint8_t from,
  uint8_t to
);

/**
 * @brief Updates hash based on move
 *
 * POSITION_SIDE, POSITION_CASTLING and POSITION_EP_SQUARE must still contain
 * their pre-move values. new_ep_square should be the effective en-passant 
 * target, since otherwise positions with different legality for en-passant 
 * but same board state would collide.
 */
void hash_make_move(
  const move_t *move,
  uint8_t moving_piece,
  uint8_t placed_piece,
  uint8_t captured_piece,
  uint8_t captured_square,
  uint8_t new_castling,
  uint8_t new_ep_square
);

/**
 * @brief Restores global hash to `key`
 */
void hash_restore(const hash_key_t *key);

static inline uint8_t hash_key_equals(
  const hash_key_t *left,
  const hash_key_t *right
)
{
  return
    left->part[0] == right->part[0] &&
    left->part[1] == right->part[1];
}

#endif
