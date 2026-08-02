/**
 * @file main.c
 * 
 * Sets up workspaces for engine (e.g. making sure VRAM is available), 
 * implements top-most game loop
 */

#include <stdint.h>

#include "debug.h"
#include <graphx.h>

#include "engine/engine.h"
#include "engine/movegen.h"
#include "engine/position.h"
#include "engine/storage.h"
#include "engine/types.h"

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

    position_from_fen("rnbqkbnr/pp1pp2p/2p3p1/4Pp2/8/2N5/PPPP1PPP/R1BQKBNR w KQkq f6 0 4");
    uint8_t move_count = movegen_generate(
      move_list_base[0],
      218,
      GEN_ALL
    );

    dbg_printf(
      "%u\n", move_count
    );
  }

  gfx_End();

  return result;
}
