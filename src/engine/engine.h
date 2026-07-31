/**
 * @file engine.h
 * 
 * Interface for MinTI engine
 */

#ifndef MINTI_ENGINE_ENGINE_H
#define MINTI_ENGINE_ENGINE_H

#include "stdint.h"

/**
 * @brief Initializes engine state
 * 
 * Must be called only after entering graphx 8-bpp single-buffer mode, because
 * initialization writes into the unused second framebuffer.
 */
uint8_t engine_init(void);

#endif
