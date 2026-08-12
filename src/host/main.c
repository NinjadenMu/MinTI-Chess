#include "debug.h"
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

#include "../engine/engine.h"
#include "../engine/search.h"

int main(void)
{
  if (engine_init() != 0) {
    dbg_printf("engine initialization failed\n");
    return 1;
  }

  search_result_t result;

  if (search_position(4, &result) != 0) {
    dbg_printf("search failed\n");
    return 1;
  }

  printf("%d\n", (int32_t)result.score);
  return 0;
}
