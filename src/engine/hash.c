/**
 * @file hash.c
 *
 * Implementation of hash.h
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "hash.h"
#include "types.h"

typedef struct {
  hash_key_t key;
  uint8_t padding[2]; // padding to 8 bytes for indexing efficiency
} hash_component_t;

// there aren't actually 16 pieces, so some entries are ignored
static hash_component_t piece_random[16][128];
static hash_component_t castling_random[4];
static hash_component_t ep_file_random[8];
static hash_component_t side_random;

static uint32_t random_state[2];

static inline void key_add(
  hash_key_t *key,
  const hash_key_t *value
)
{
  key->part[0] += value->part[0];
  key->part[1] += value->part[1];
}

static inline void key_subtract(
  hash_key_t *key,
  const hash_key_t *value
)
{
  key->part[0] -= value->part[0];
  key->part[1] -= value->part[1];
}

static uint24_t next_random(uint8_t part)
{
  uint32_t value = random_state[part];

  value ^= value << 13;
  value ^= value >> 17;
  value ^= value << 5;

  random_state[part] = value;
  return value;
}

static void initialize_random_key(hash_component_t *random)
{
  random->key.part[0] = next_random(0);
  random->key.part[1] = next_random(1);
}

void hash_init(void)
{
  // I like listening to these guys when coding ;)
  random_state[0] = 0x734C6F57u;
  random_state[1] = 0x64497645u;

  for (uint8_t piece = 0; piece < 16; ++piece) {
    for (uint8_t square = 0; square < 128; ++square) {
      initialize_random_key(
        &piece_random[piece][square]
      );
    }
  }

  for (uint8_t index = 0; index < 4; ++index) {
    initialize_random_key(&castling_random[index]);
  }

  for (uint8_t file = 0; file < 8; ++file) {
    initialize_random_key(&ep_file_random[file]);
  }

  initialize_random_key(&side_random);
  hash_clear();
}

void hash_clear(void)
{
  HASH.part[0] = 0;
  HASH.part[1] = 0;
}

static void calculate_position_hash(hash_key_t *key)
{
  key->part[0] = 0;
  key->part[1] = 0;

  for (
    uint8_t color_index = 0;
    color_index < 2;
    ++color_index
  ) {
    uint8_t count = PIECE_COUNT[color_index];
    uint8_t *piece_list = PIECE_LIST[color_index];

    for (uint8_t index = 0; index < count; ++index) {
      uint8_t square = piece_list[index];
      uint8_t piece = BOARD[square];

      key_add(
        key,
        &piece_random[piece][square].key
      );
    }
  }

  uint8_t castling = POSITION_CASTLING;

  if (castling & CASTLE_WHITE_KING) {
    key_add(key, &castling_random[0].key);
  }
  if (castling & CASTLE_WHITE_QUEEN) {
    key_add(key, &castling_random[1].key);
  }
  if (castling & CASTLE_BLACK_KING) {
    key_add(key, &castling_random[2].key);
  }
  if (castling & CASTLE_BLACK_QUEEN) {
    key_add(key, &castling_random[3].key);
  }

  uint8_t ep_square = POSITION_EP_SQUARE;

  if (ep_square != SQUARE_NONE) {
    key_add(
      key,
      &ep_file_random[SQUARE_FILE(ep_square)].key
    );
  }

  if (POSITION_SIDE == COLOR_BLACK) {
    key_add(key, &side_random.key);
  }
}

void hash_rebuild(void)
{
  hash_key_t key;

  calculate_position_hash(&key);
  hash_restore(&key);
}

void hash_add_piece(
  uint8_t piece,
  uint8_t square
)
{
  key_add(
    HASH_ADDR,
    &piece_random[piece][square].key
  );
}

void hash_remove_piece(
  uint8_t piece,
  uint8_t square
)
{
  key_subtract(
    HASH_ADDR,
    &piece_random[piece][square].key
  );
}

void hash_move_piece(
  uint8_t piece,
  uint8_t from,
  uint8_t to
)
{
  hash_key_t *key = HASH_ADDR;

  key_subtract(
    key,
    &piece_random[piece][from].key
  );
  key_add(
    key,
    &piece_random[piece][to].key
  );
}

void hash_key_remove_ep_file(
  hash_key_t *key,
  uint8_t file
)
{
  key_subtract(
    key,
    &ep_file_random[file].key
  );
}

void hash_make_move(
  const move_t *move,
  uint8_t moving_piece,
  uint8_t placed_piece,
  uint8_t captured_piece,
  uint8_t captured_square,
  uint8_t new_castling,
  uint8_t new_ep_square
)
{
  const hash_key_t *current = HASH_ADDR;
  hash_key_t key;

  key.part[0] = current->part[0];
  key.part[1] = current->part[1];

  if (captured_piece != PIECE_EMPTY) {
    key_subtract(
      &key,
      &piece_random[captured_piece][captured_square].key
    );
  }

  key_subtract(
    &key,
    &piece_random[moving_piece][move->from].key
  );
  key_add(
    &key,
    &piece_random[placed_piece][move->to].key
  );

  if (move->flags & MF_CASTLE) {
    uint8_t rook_from = move->to > move->from
      ? move->to + 1
      : move->to - 2;
    uint8_t rook_to =
      (move->from + move->to) >> 1;
    uint8_t rook =
      PIECE_COLOR(moving_piece) | PIECE_ROOK;

    key_subtract(
      &key,
      &piece_random[rook][rook_from].key
    );
    key_add(
      &key,
      &piece_random[rook][rook_to].key
    );
  }

  uint8_t old_castling = POSITION_CASTLING;

  if (old_castling != new_castling) {
    uint8_t revoked =
      old_castling & (CASTLE_ALL ^ new_castling);

    if (revoked & CASTLE_WHITE_KING) {
      key_subtract(&key, &castling_random[0].key);
    }
    if (revoked & CASTLE_WHITE_QUEEN) {
      key_subtract(&key, &castling_random[1].key);
    }
    if (revoked & CASTLE_BLACK_KING) {
      key_subtract(&key, &castling_random[2].key);
    }
    if (revoked & CASTLE_BLACK_QUEEN) {
      key_subtract(&key, &castling_random[3].key);
    }
  }

  uint8_t old_ep_square = POSITION_EP_SQUARE;

  if (old_ep_square != SQUARE_NONE) {
    key_subtract(
      &key,
      &ep_file_random[SQUARE_FILE(old_ep_square)].key
    );
  }

  if (new_ep_square != SQUARE_NONE) {
    key_add(
      &key,
      &ep_file_random[SQUARE_FILE(new_ep_square)].key
    );
  }

  if (POSITION_SIDE == COLOR_WHITE) {
    key_add(&key, &side_random.key);
  }
  else {
    key_subtract(&key, &side_random.key);
  }

  hash_restore(&key);
}

void hash_make_null_move(void)
{
  hash_key_t *key = HASH_ADDR;
  uint8_t ep_square = POSITION_EP_SQUARE;

  if (ep_square != SQUARE_NONE) {
    key_subtract(
      key,
      &ep_file_random[SQUARE_FILE(ep_square)].key
    );
  }

  if (POSITION_SIDE == COLOR_WHITE) {
    key_add(key, &side_random.key);
  }
  else {
    key_subtract(key, &side_random.key);
  }
}

void hash_restore(const hash_key_t *key)
{
  hash_key_t *current = HASH_ADDR;

  current->part[0] = key->part[0];
  current->part[1] = key->part[1];
}
