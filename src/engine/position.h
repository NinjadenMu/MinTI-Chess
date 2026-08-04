/**
 * @file position.h
 * 
 * Low level utilities for setting and reading position state.
 * More complex utilities like `make_move` build on these.
 */

#ifndef MINTI_ENGINE_POSITION_H
#define MINTI_ENGINE_POSITION_H

#include <stdint.h>

#include "../ce/memory_map.h"
#include "types.h"

/*
 * Functions for setting board state
 */
void position_clear(void);
uint8_t position_set_start(void);
uint8_t position_from_fen(const char *fen);

/*
 * Low-level board operations used by `make_move` and higher level operations
 */

/**
 * @brief Adds `piece` to board at `square`
 * @return 0 on success, 1 on failure
 */
uint8_t position_add_piece(uint8_t square, uint8_t piece);
/**
 * @brief Removes piece from `square`
 * @return piece removed
 */
uint8_t position_remove_piece(uint8_t square);
/**
 * @brief Moves piece from `from` to `to`
 * @return 0 on success, 1 on failure
 */
uint8_t position_move_piece(uint8_t from, uint8_t to);

static inline uint8_t position_piece_at(uint8_t square)
{
  return BOARD[square];
}

uint8_t position_is_consistent(void);

#endif
