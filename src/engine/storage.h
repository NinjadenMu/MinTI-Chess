/**
 * @file storage.h
 * 
 * Search state storage allocation in .bss
 */

#ifndef MINTI_ENGINE_STORAGE_H
#define MINTI_ENGINE_STORAGE_H

#include "../config.h"
#include "types.h"

// Arena for storing move lists
extern move_t move_arena[MOVE_ARENA_CAPACITY];

// Pointers to start of each ply's move list in `move_arena`
extern move_t *move_list_base[MAX_PLY + 2];

#endif
