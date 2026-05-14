#ifndef MOVEGEN_H
#define MOVEGEN_H 1

#include "attributes.h"
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

#define INLINE static inline __attribute__((always_inline))

#define N_OFFSET (-16)
#define NE_OFFSET (-15)
#define E_OFFSET (1)
#define SE_OFFSET (17)
#define S_OFFSET (16)
#define SW_OFFSET (15)
#define W_OFFSET (-1)
#define NW_OFFSET (-17)

#endif