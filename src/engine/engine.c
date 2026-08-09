/**
 * @file engine.c
 * 
 * Implementation of engine.h
 */

#include <stdint.h>
#include <string.h>

#include "../config.h"
#include "../ce/memory_map.h"
#include "engine.h"
#include "evaluation.h"
#include "position.h"
#include "storage.h"
#include "types.h"

static void mark_attack(int delta, uint8_t attacker_mask)
{
  DELTA_ATTACKERS[DELTA_TABLE_INDEX(delta)] |= attacker_mask;
}

static void mark_ray(
  int delta,
  int8_t step,
  uint8_t attacker_mask
)
{
  uint8_t index = DELTA_TABLE_INDEX(delta);

  DELTA_ATTACKERS[index] |= attacker_mask;
  DELTA_STEP[index] = step;
}

static void init_delta_tables(void) {
  memset(DELTA_ATTACKERS, 0, DELTA_TABLE_SIZE);
  memset(DELTA_STEP, 0, DELTA_TABLE_SIZE);

  for (uint8_t distance = 1; distance <= 7; ++distance) {
    mark_ray(distance, 1, ATK_ORTH);
    mark_ray(-distance, -1, ATK_ORTH);

    mark_ray(16 * distance, 16, ATK_ORTH);
    mark_ray(-16 * distance, -16, ATK_ORTH);

    mark_ray(15 * distance, 15, ATK_DIAG);
    mark_ray(-15 * distance, -15, ATK_DIAG);

    mark_ray(17 * distance, 17, ATK_DIAG);
    mark_ray(-17 * distance, -17, ATK_DIAG);
  }

  mark_attack(15, ATK_WPAWN);
  mark_attack(17, ATK_WPAWN);
  mark_attack(-15, ATK_BPAWN);
  mark_attack(-17, ATK_BPAWN);

  mark_attack(-33, ATK_KNIGHT);
  mark_attack(-31, ATK_KNIGHT);
  mark_attack(-18, ATK_KNIGHT);
  mark_attack(-14, ATK_KNIGHT);
  mark_attack(14, ATK_KNIGHT);
  mark_attack(18, ATK_KNIGHT);
  mark_attack(31, ATK_KNIGHT);
  mark_attack(33, ATK_KNIGHT);

  mark_attack(-17, ATK_KING);
  mark_attack(-16, ATK_KING);
  mark_attack(-15, ATK_KING);
  mark_attack(-1, ATK_KING);
  mark_attack(1, ATK_KING);
  mark_attack(15, ATK_KING);
  mark_attack(16, ATK_KING);
  mark_attack(17, ATK_KING);
}

uint8_t engine_init(void) {
  evaluation_init();
  hash_init();
  init_delta_tables();

  memset(move_list_base, 0, sizeof(move_list_base));
  move_list_base[0] = move_arena;

  return position_set_start();
}
