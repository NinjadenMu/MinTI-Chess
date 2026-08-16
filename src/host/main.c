/**
 * @file main.c
 *
 * Host terminal game
 */

#include <stdio.h>
#include <stdlib.h>

#include "../engine/engine.h"
#include "game.h"

int main(void)
{
  if (engine_init() != 0) {
    fputs(
      "MinTI engine initialization failed.\n",
      stderr
    );
    return EXIT_FAILURE;
  }

  return game_run() == 0
    ? EXIT_SUCCESS
    : EXIT_FAILURE;
}
