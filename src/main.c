/**
 * @file main.c
 * 
 * Sets up workspaces for engine (e.g. making sure VRAM is available), 
 * implements top-most game loop
 */

#include <stdint.h>

#include "debug.h"
#include <graphx.h>
#include <ti/getcsc.h>

#include "engine/engine.h"
#include "test/perft_tests.h"

/*
 * Sets up workspaces for engine, main control loop
 */
int main(void)
{
  uint8_t result;

  /*
   * Set calculator to 8bpp mode and select one frame buffer, 
   * freeing the other frame buffer for use by MinTI
   */
  gfx_Begin();
  gfx_SetDrawScreen();
  gfx_SetDefaultPalette(gfx_8bpp);

  gfx_FillScreen(255);
  gfx_SetTextFGColor(0);
  gfx_SetTextBGColor(255);
  gfx_SetTextTransparentColor(255);

  result = engine_init();

  if (result) {
    dbg_printf("Engine initialization failed.\n");
    gfx_PrintStringXY("Engine initialization failed.", 8, 8);
  }
  else {
    dbg_printf("MinTI Chess initialized.\n");
    gfx_PrintStringXY("MinTI Chess initialized.", 8, 8);

    gfx_PrintStringXY("MinTI Chess initialized.", 8, 8);

    run_perft_tests();

    gfx_PrintStringXY(
      "Press any key to exit.",
      8,
      216
    );

    while (!os_GetCSC()) {
    }
  }

  gfx_End();

  return result;
}
