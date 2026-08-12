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

void hash_key_remove_ep_file(
  hash_key_t *key,
  uint8_t file
);

/**
 * @brief Updates hash based on move
 *
 * POSITION_SIDE, POSITION_CASTLING and POSITION_EP_SQUARE must still contain
 * their pre-move values. new_ep_square should be the pseudolegal 
 * en-passant target, since otherwise positions with different pseudolegality 
 * for en-passant but otherwise equivalent board state could collide.
 * 
 * While this technically should be fully legal, pseudolegal is much faster 
 * to check so it makes sense for search, and can't cause an incorrect 
 * transposition table entry to be read.  It's also exceedingly unlikely 
 * for it to cause incorrect 3-fold detection (also, it can only cause false 
 * negatives), so it's worth the "risk" in search, and the actual game loop 
 * can simply do the more expensive legality check and change the hash itself).
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
 * @brief Updates hash for a null move
 *
 * POSITION_SIDE and POSITION_EP_SQUARE must contain their pre-null
 * values.
 */
void hash_make_null_move(void);

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
