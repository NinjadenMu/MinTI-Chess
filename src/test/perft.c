/**
 * @file perft.c
 * 
 * Implementation of perft.h
 */

#include <stddef.h>
#include <stdint.h>

#include "../config.h"
#include "../ce/memory_map.h"
#include "../engine/attack.h"
#include "../engine/legality.h"
#include "../engine/make_move.h"
#include "../engine/movegen.h"
#include "../engine/storage.h"
#include "../engine/types.h"
#include "perft.h"

static uint8_t perft_search(
  uint8_t depth,
  uint8_t ply,
  uint24_t *nodes
)
{
  move_t *const arena_end =
    move_arena + MOVE_ARENA_CAPACITY;

  if (depth == 0) {
    *nodes = 1;
    return 0;
  }

  if (ply >= MAX_PLY) {
    return 1;
  }

  move_t *moves = move_list_base[ply];

  if (moves >= arena_end) {
    return 1;
  }

  uint24_t remaining = arena_end - moves;
  uint8_t capacity = remaining >= 0xff // avoid overflow
    ? 0xfe
    : remaining;

  uint24_t move_count = movegen_generate(
    moves,
    capacity,
    GEN_ALL
  );
  if (move_count == MOVEGEN_OVERFLOW) {
    return 1;
  }

  move_list_base[ply + 1] = moves + move_count;
  king_info_t *info = &king_info_stack[ply];

  king_scan(POSITION_SIDE, info);

  uint24_t total = 0;
  if (depth == 1) {
    uint8_t index;

    for (index = 0; index < move_count; ++index) {
      if (move_is_legal(&moves[index], info)) {
        ++total;
      }
    }

    *nodes = total;
    return 0;
  }

  for (uint8_t index = 0; index < move_count; ++index) {
    move_t *move = &moves[index];
    uint24_t child_nodes;
    uint8_t status;

    if (!move_is_legal(move, info)) {
      continue;
    }

    make_move(move, &undo_stack[ply]);

    status = perft_search(
      depth - 1,
      ply + 1,
      &child_nodes
    );

    unmake_move(move, &undo_stack[ply]);

    if (status) {
      return status;
    }

    total += child_nodes;
  }

  *nodes = total;
  return 0;
}

uint8_t perft_count(uint8_t depth, uint24_t *nodes)
{
  if (nodes == NULL) {
    return 1;
  }

  *nodes = 0;

  if (depth > MAX_PLY) {
    return 1;
  }

  move_list_base[0] = move_arena;

  return perft_search(depth, 0, nodes);
}
