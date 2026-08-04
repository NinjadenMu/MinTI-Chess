/**
 * @file perft_tests.c
 * 
 * Implementation of perft_tests.h
 */

#include <stdint.h>
#include <time.h>

#include <graphx.h>

#include "../engine/position.h"
#include "perft.h"
#include "perft_tests.h"

enum {
  PERFT_TEXT_X = 8,
  PERFT_DETAIL_X = 24,
  PERFT_FIRST_Y = 24,
  PERFT_ROW_HEIGHT = 32,
  PERFT_DETAIL_OFFSET = 12,
  PERFT_SUMMARY_Y = 192,
  PERFT_BACKGROUND = 255
};

typedef struct {
  const char *name;
  const char *fen;
  uint8_t depth;
  uint24_t expected;
} perft_test_t;

static void perft_clear_line(uint8_t y)
{
  uint8_t previous_color =
    gfx_SetColor(PERFT_BACKGROUND);

  gfx_FillRectangle_NoClip(
    0,
    y,
    GFX_LCD_WIDTH,
    8
  );

  gfx_SetColor(previous_color);
}

static void perft_print_test_name(
  const perft_test_t *test,
  uint8_t y
)
{
  gfx_SetTextXY(PERFT_TEXT_X, y);
  gfx_PrintString(test->name);
  gfx_PrintString(" depth ");
  gfx_PrintUInt(test->depth, 1);
  gfx_PrintString(": ");
}

static uint24_t perft_nodes_per_second(
  uint24_t nodes,
  clock_t elapsed
)
{
  if (elapsed == 0) {
    return 0;
  }

  uint64_t scaled_nodes =
    (uint64_t)nodes * CLOCKS_PER_SEC;

  return (
    scaled_nodes + elapsed / 2
  ) / elapsed;
}

uint8_t run_perft_tests(void)
{
  static const perft_test_t tests[] = {
    {
      "startpos",
      "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq -",
      3,
      8902
    },
    {
      "kiwipete",
      "r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq -",
      3,
      97862
    },
    {
      "position 3",
      "8/2p5/3p4/KP5r/1R3p1k/8/4P1P1/8 w - -",
      3,
      2812
    },
    {
      "position 4",
      "r3k2r/Pppp1ppp/1b3nbN/nP6/BBP1P3/q4N2/Pp1P2PP/R2Q1RK1 w kq -",
      3,
      9467
    },
    {
      "position 5",
      "rnbq1k1r/pp1Pbppp/2p5/8/2B5/8/PPP1NnPP/RNBQK2R w KQ - 1 8",
      3,
      62379
    }
  };

  uint8_t failures = 0;

  gfx_SetTextFGColor(0);
  gfx_SetTextBGColor(PERFT_BACKGROUND);
  gfx_SetTextTransparentColor(PERFT_BACKGROUND);

  for (
    uint8_t index = 0;
    index < sizeof(tests) / sizeof(tests[0]);
    ++index
  ) {
    const perft_test_t *test = &tests[index];
    uint8_t y =
      PERFT_FIRST_Y + index * PERFT_ROW_HEIGHT;
    uint8_t detail_y =
      y + PERFT_DETAIL_OFFSET;
    uint24_t nodes;

    perft_clear_line(y);
    perft_clear_line(detail_y);
    perft_print_test_name(test, y);
    gfx_PrintString("running...");

    if (position_from_fen(test->fen)) {
      perft_clear_line(y);
      perft_print_test_name(test, y);
      gfx_PrintString("INVALID FEN");
      ++failures;
      continue;
    }

    clock_t started = clock();
    uint8_t status =
      perft_count(test->depth, &nodes);
    clock_t elapsed = clock() - started;

    perft_clear_line(y);
    perft_print_test_name(test, y);

    if (status) {
      gfx_PrintString("ERROR ");
      gfx_PrintUInt(status, 1);
      ++failures;
      continue;
    }

    uint8_t passed = nodes == test->expected;
    uint24_t nodes_per_second =
      perft_nodes_per_second(nodes, elapsed);

    gfx_PrintString(passed ? "PASS (" : "FAIL (");
    gfx_PrintUInt(nodes, 1);
    gfx_PrintString("/");
    gfx_PrintUInt(test->expected, 1);
    gfx_PrintString(")");

    gfx_SetTextXY(PERFT_DETAIL_X, detail_y);
    gfx_PrintUInt(nodes_per_second, 1);
    gfx_PrintString(" nodes/s");

    if (!passed) {
      ++failures;
    }
  }

  perft_clear_line(PERFT_SUMMARY_Y);
  gfx_SetTextXY(PERFT_TEXT_X, PERFT_SUMMARY_Y);
  gfx_PrintString("Perft: ");
  gfx_PrintUInt(failures, 1);
  gfx_PrintString(
    failures == 1 ? " failure" : " failures"
  );

  position_set_start();

  return failures;
}
