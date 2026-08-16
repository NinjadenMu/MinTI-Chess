/**
 * @file main.c
 *
 * Initializes calculator resources and launches the MinTI game.
 */

#include <graphx.h>
#include <stdint.h>
#include <ti/getcsc.h>

#include "game.h"
#include "../engine/engine.h"
#include "../engine/position.h"

int main(void)
{
  gfx_Begin();
  gfx_SetDrawScreen();
  gfx_SetDefaultPalette(gfx_8bpp);

  game_init_graphics();

  uint8_t status = engine_init();

  if (status) {
    gfx_FillScreen(255);
    gfx_PrintStringXY(
      "Engine initialization failed.",
      24,
      96
    );
    gfx_PrintStringXY("Press any key.", 24, 120);

    while (!os_GetCSC()) {
    }
  }
  else {
    status = game_run();
  }

  gfx_End();
  return status;
}
