/**
 * @file main.c
 *
 * Initializes calculator resources and launches the MinTI game.
 */

#include <graphx.h>
#include <stdint.h>
#include <ti/getcsc.h>

#include "ce/game.h"
#include "engine/engine.h"
#include "engine/position.h"

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
    //position_from_fen("1n1Rkb1r/p4ppp/4q3/4p1B1/4P3/8/PPP2PPP/2K5 b k - 1 17");
    status = game_run();
  }

  gfx_End();
  return status;
}
