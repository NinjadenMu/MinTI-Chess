#ifndef MOVEGEN_H
#define MOVEGEN_H 1

#include "types.h"

/**
 * @brief Generates pseudo-legal moves for a specified stage of search and 
 *        writes them to a provided buffer
 * 
 * @param[in] stage The generation stage to execute (HASH/CAPTURES/QUIETS)
 * @param[in, out] move_list Pointer to the start of the pre-allocated Move
 *                           buffer where generated moves will be written
 * 
 * @returns A pointer to the memory location immediately following the last 
 *          written move
 */
Move *generate_moves(Stage stage, Move *move_list);

#endif