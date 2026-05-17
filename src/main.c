#include <stdint.h>
#include <stdbool.h>
#include <debug.h>

#include "consts.h"
#include "types.h"

#include "board.h"

// Just for testing purposes
#include "movegen.h"

Move move_pool[MAX_PLY * SAFE_MOVES_PER_PLY];

int main(void) {
  // Just for testing purposes
  dbg_printf("Entered program\n");
  reset_board();
  dbg_printf("Board set\n");
  Move *move_list = move_pool;
  dbg_printf("move_list: %p\n", move_list);
  move_list = generate_moves(CAPTURES, move_list);
  dbg_printf("move_list: %p\n", move_list);
  move_list = generate_moves(QUIETS, move_list);
  dbg_printf("move_list: %p\n", move_list);

  return (int)move_list;
}