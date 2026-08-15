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

static const uint16_t minti_palette[] = {
  gfx_RGBTo1555(0, 0, 0),
  gfx_RGBTo1555(145, 145, 145),
  gfx_RGBTo1555(105, 185, 255),
  gfx_RGBTo1555(145, 25, 35)
};

int main(void)
{
  gfx_Begin();
  gfx_SetDrawScreen();
  gfx_SetDefaultPalette(gfx_8bpp);
  gfx_SetPalette(
    minti_palette,
    sizeof(minti_palette),
    0
  );

  gfx_SetTextFGColor(0);
  gfx_SetTextBGColor(255);
  gfx_SetTextTransparentColor(255);

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
