/**
 * @file perft.h
 *
 * Legal move generation correctness testing
 */

#ifndef MINTI_ENGINE_PERFT_H
#define MINTI_ENGINE_PERFT_H

#include <stdint.h>

/**
 * @brief Counts leaf nodes at the requested depth
 * @param[in] depth - number of plies to search, 0 returns 1
 * @param[out] nodes - destination for the resulting node count
 *
 * @return 0 on success, 1 otherwise
 */
uint8_t perft_count(uint8_t depth, uint24_t *nodes);

#endif
