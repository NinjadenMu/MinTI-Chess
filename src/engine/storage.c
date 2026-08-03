/**
 * @file storage.c
 * 
 * Implementation of storage.h (search state buffer allocation in .bss)
 */

#include "storage.h"

move_t move_arena[MOVE_ARENA_CAPACITY];
move_t *move_list_base[MAX_PLY + 2];
king_info_t king_info_stack[MAX_PLY + 2];
undo_t undo_stack[MAX_PLY + 2];
