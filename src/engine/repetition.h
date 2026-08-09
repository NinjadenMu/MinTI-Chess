/**
 * @file repetition.h
 *
 * Three-fold repetition detection
 */

#ifndef MINTI_ENGINE_REPETITION_H
#define MINTI_ENGINE_REPETITION_H

#include <stdint.h>

/**
 * @brief Resets game history and initializes it with current position
 */
void repetition_game_reset(void);

/**
 * @brief Records the current actual-game position
 *
 * This performs full en-passant legality verification. Use for actual 
 * game moves.
 *
 * @return 1 if the recorded position has now occurred three times
 */
uint8_t repetition_game_push(void);

/**
 * @brief Tests repetition while searching
 *
 * Uses pseudolegal en-passant hashing and checks both undo_stack and the
 * actual game history.
 *
 * @param[in] ply - current search ply
 * @return 1 if the current position has occurred three times
 */
uint8_t repetition_search_is_threefold(uint8_t ply);

#endif
