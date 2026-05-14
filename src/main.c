#include <stdint.h>
#include <stdbool.h>

#include "attributes.h"
#include "types.h"

#include "board.h"

// Just for testing purposes
#include "movegen.h"

Move move_pool[MAX_PLY * SAFE_MOVES_PER_PLY];

int main(void) {
  // Just for testing purposes
  Move *move_list;
  move_list = generate_moves(CAPTURES, move_pool);
  move_list = generate_moves(QUIETS, move_pool);

  return (int)move_list;
}