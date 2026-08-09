/**
 * @file repetition.c
 *
 * Implementation of repetition.h
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "hash.h"
#include "position.h"
#include "repetition.h"
#include "storage.h"
#include "types.h"

enum {
  REPETITION_HISTORY_CAPACITY = 128, // enough for 50 move rule
  REPETITION_HISTORY_MASK =
    REPETITION_HISTORY_CAPACITY - 1
};

typedef struct {
  hash_key_t key; // uses standard hash with pseudolegal en passant
  uint8_t ignored_ep_file; // 1 if en passant target is actually illegal
  uint8_t padding; // makes struct 8 bytes for cheap indexing
} repetition_entry_t;

static repetition_entry_t game_history[
  REPETITION_HISTORY_CAPACITY
];

static uint8_t game_history_head;
static uint8_t game_history_count;

static void record_current(repetition_entry_t *entry)
{
  const hash_key_t *key = HASH_ADDR;

  entry->key.part[0] = key->part[0];
  entry->key.part[1] = key->part[1];
  entry->ignored_ep_file = SQUARE_NONE;

  uint8_t ep_square = POSITION_EP_SQUARE;

  if (
    ep_square != SQUARE_NONE &&
    position_legal_ep_square() == SQUARE_NONE
  ) {
    entry->ignored_ep_file = SQUARE_FILE(ep_square);
  }
}

static uint8_t game_key_equals(
  const hash_key_t *key,
  const repetition_entry_t *entry
)
{
  if (entry->ignored_ep_file == SQUARE_NONE) {
    return hash_key_equals(key, &entry->key);
  }

  hash_key_t normalized;

  normalized.part[0] = entry->key.part[0];
  normalized.part[1] = entry->key.part[1];

  hash_key_remove_ep_file(
    &normalized,
    entry->ignored_ep_file
  );

  return hash_key_equals(key, &normalized);
}

static uint8_t game_history_is_threefold(void)
{
  if (POSITION_HALFMOVE < 8) {
    return 0;
  }

  const repetition_entry_t *current_entry =
    &game_history[game_history_head];
  const hash_key_t *current = &current_entry->key;
  hash_key_t normalized_current;

  if (current_entry->ignored_ep_file != SQUARE_NONE) {
    normalized_current.part[0] =
      current_entry->key.part[0];
    normalized_current.part[1] =
      current_entry->key.part[1];

    hash_key_remove_ep_file(
      &normalized_current,
      current_entry->ignored_ep_file
    );

    current = &normalized_current;
  }

  uint8_t matches = 1;
  uint8_t distance = 4;
  uint8_t index = 
    (game_history_head - distance) & 
    REPETITION_HISTORY_MASK;

  while (
    distance < game_history_count &&
    distance <= POSITION_HALFMOVE
  ) {
    if (
      game_key_equals(
        current,
        &game_history[index]
      )
    ) {
      ++matches;

      if (matches == 3) {
        return 1;
      }
    }

    distance += 2;
    index = (index - 2) & REPETITION_HISTORY_MASK;
  }

  return 0;
}

void repetition_game_reset(void)
{
  game_history_head = 0;
  game_history_count = 1;

  record_current(&game_history[0]);
}

uint8_t repetition_game_push(void)
{
  if (game_history_count == 0) {
    repetition_game_reset();
    return 0;
  }

  game_history_head =
    (game_history_head + 1) &
    REPETITION_HISTORY_MASK;

  record_current(&game_history[game_history_head]);

  if (
    game_history_count <
    REPETITION_HISTORY_CAPACITY
  ) {
    ++game_history_count;
  }

  return game_history_is_threefold();
}

uint8_t repetition_search_is_threefold(uint8_t ply)
{
  uint8_t halfmove = POSITION_HALFMOVE;

  if (halfmove < 8) {
    return 0;
  }

  const hash_key_t *current = HASH_ADDR;
  uint8_t matches = 1;
  uint8_t distance = 4;

  while (
    distance <= ply &&
    distance <= halfmove
  ) {
    const hash_key_t *previous =
      &undo_stack[ply - distance].hash;

    if (hash_key_equals(current, previous)) {
      ++matches;

      if (matches == 3) {
        return 1;
      }
    }

    distance += 2;
  }

  // first prior game position with correct side to move depends on ply parity
  uint8_t history_distance = 2 - (ply & 1);
  // the search root is in game_history[game_history_head] and the undo stack
  uint8_t total_distance =
    ply + history_distance;
  if (total_distance < 4) {
    history_distance += 2;
    total_distance += 2;
  }
  uint8_t index = 
    (game_history_head - history_distance) &
    REPETITION_HISTORY_MASK;

  while (
    history_distance < game_history_count &&
    total_distance <= halfmove
  ) {
    if (
      hash_key_equals(
        current,
        &game_history[index].key
      )
    ) {
      ++matches;

      if (matches == 3) {
        return 1;
      }
    }

    history_distance += 2;
    total_distance += 2;
    index = (index - 2) & REPETITION_HISTORY_MASK;
  }

  return 0;
}
