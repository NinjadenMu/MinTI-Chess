/**
 * @file config.h
 * 
 * Build-time configuration parameters for MinTI
 */

#ifndef MINTI_CONFIG_H
#define MINTI_CONFIG_H

/*
 * Maximum depth of recursive search
 * Used to size global arrays containing search state, which can't fit in 
 * 4 KiB stack.
 */
#define MAX_PLY 32

/*
 * Size of shared arena for active move lists
 */
#define MOVE_ARENA_CAPACITY 1024

/* Fixed search depth used by the calculator game loop. */
#define GAME_SEARCH_DEPTH 4

#endif
