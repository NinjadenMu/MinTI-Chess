/**
 * @file legality.h
 * 
 * Fast legality checking for pseudolegal moves
 */

#ifndef MINTI_ENGINE_LEGALITY_H
#define MINTI_ENGINE_LEGALITY_H

#include <stdint.h>

#include "attack.h"
#include "types.h"

/**
 * @brief Tests whether a pseudolegal move is legal
 *
 * `info` must describe the current side to move and must have been produced
 * by `king_scan()` before the position was changed.
 *
 * Only for internal use by pseudomoves from `movegen`, which already does 
 * some checking that this function doesn't repeat.
 *
 * @return 1 if legal, 0 otherwise
 */
uint8_t move_is_legal(
  const move_t *move,
  const king_info_t *info
);

#endif
