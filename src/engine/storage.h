/**
 * @file storage.h
 * 
 * Shared ply-indexed buffer allocation in .bss
 */

#ifndef MINTI_ENGINE_STORAGE_H
#define MINTI_ENGINE_STORAGE_H

#include "../config.h"
#include "attack.h"
#include "make_move.h"
#include "types.h"

// Arena for storing move lists
extern move_t move_arena[MOVE_ARENA_CAPACITY];

// Pointers to start of each ply's move list in `move_arena`
extern move_t *move_list_base[MAX_PLY + 2];

/*
 * king info is useful to compute since we can reuse it for legality checking 
 * of every move in a ply.  Therefore, `king_info_t` structs are stored here.
 */
extern king_info_t king_info_stack[MAX_PLY + 2];

// Saved position state for make/unmake at each ply
extern undo_t undo_stack[MAX_PLY + 2];

#endif
