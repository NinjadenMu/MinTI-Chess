#include "debug.h"
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

#include "../engine/engine.h"
#include "../engine/position.h"
#include "../engine/search.h"

int main(void)
{
  if (engine_init() != 0) {
    dbg_printf("engine initialization failed\n");
    return 1;
  }

  position_from_fen("8/7p/8/2p3pP/3k2P1/P4K2/5P2/8 b - - 0 2");

  search_result_t result;

  if (search_position(4, &result) != 0) {
    dbg_printf("search failed\n");
    return 1;
  }

  printf("%hhu to %hhu\n", result.best_move.from, result.best_move.to);
  printf("%d\n", (int32_t)result.score);
  return 0;
}
