/**
 * @file transposition.c
 * 
 * Implementation of transposition.h
 */

#include <stdint.h>
#include <string.h>

#include "../ce/memory_map.h"
#include "../config.h"
#include "hash.h"
#include "search.h"
#include "transposition.h"
#include "types.h"

enum {
  TT_ENTRY_COUNT = 8192, // 8 byte entries from 0xD54000 to 0xD64000
  TT_INDEX_MASK = TT_ENTRY_COUNT - 1,

  TT_META_BOUND_MASK = 0x03,
  TT_META_DEPTH_SHIFT = 2,
  TT_META_DEPTH_MASK = 0x7C,

  TT_MOVE_NORMAL = 0,
  // promotion flags are differently encoded to be more compact
  // castling and en-passant aren't stored because they're reconstructable
  TT_MOVE_PROMO_QUEEN = 1,
  TT_MOVE_PROMO_ROOK = 2,
  TT_MOVE_PROMO_BISHOP = 3,
  TT_MOVE_PROMO_KNIGHT = 4,  
  TT_MOVE_NONE = 7
};

/* 
 * Pretty ugly encoding for compactness:
 *   0x88 square representations don't use bits 3 and 7, so
 *   TT entries store compacted move flag bits in those unused bits
 */
typedef struct {
  uint24_t lock;
  uint8_t from_code;
  uint8_t to_code;
  uint8_t meta; // encoded Udddddbb
  int16_t score;
} tt_entry_t;
_Static_assert(
  sizeof(tt_entry_t) == 8,
  "transposition table entry should be 8 bytes"
);

#define TT_TABLE \
  ((tt_entry_t *)CE_ADDR_TRANSPOSITION_TABLE)

static tt_entry_t *current_entry(void)
{
  uint24_t index = HASH.part[0] & TT_INDEX_MASK;
  return &TT_TABLE[index];
}

static void store_score(
  tt_entry_t *entry,
  eval_t score,
  uint8_t ply
)
{
  if (score >= SEARCH_SCORE_MATE - MAX_PLY) {
    score += ply;
  }
  else if (score <= -SEARCH_SCORE_MATE + MAX_PLY) {
    score -= ply;
  }

  entry->score = score;
}

static eval_t load_score(
  const tt_entry_t *entry,
  uint8_t ply
)
{
  eval_t restored = entry->score;

  if (restored >= SEARCH_SCORE_MATE - MAX_PLY) {
    restored -= ply;
  }
  else if (restored <= -SEARCH_SCORE_MATE + MAX_PLY) {
    restored += ply;
  }

  return restored;
}

static uint8_t move_storage_code(
  const move_t *move
)
{
  if (!(move->flags & MF_PROMO)) {
    return TT_MOVE_NORMAL;
  }

  switch (move->flags & MF_PROMO_TYPE_MASK) {
    case MF_PROMO_QUEEN:
      return TT_MOVE_PROMO_QUEEN;

    case MF_PROMO_ROOK:
      return TT_MOVE_PROMO_ROOK;

    case MF_PROMO_BISHOP:
      return TT_MOVE_PROMO_BISHOP;

    case MF_PROMO_KNIGHT:
      return TT_MOVE_PROMO_KNIGHT;

    default:
      return TT_MOVE_NONE;
  }
}

static void store_move(
  tt_entry_t *entry,
  const move_t *move,
  uint8_t has_move
)
{
  uint8_t code;

  if (!has_move || move == 0) {
    code = TT_MOVE_NONE;
    entry->from_code = (code & 0x01) << 3;
    entry->to_code = (code & 0x04) << 1;
    entry->from_code |= (code & 0x02) << 6;
    return;
  }

  code = move_storage_code(move);

  entry->from_code =
    (move->from & 0x77) |
    ((code & 0x01) << 3) |
    ((code & 0x02) << 6);

  entry->to_code =
    (move->to & 0x77) |
    ((code & 0x04) << 1);
}

static uint8_t stored_move_code(
  const tt_entry_t *entry
)
{
  return
    ((entry->from_code >> 3) & 0x01) |
    ((entry->from_code >> 6) & 0x02) |
    ((entry->to_code >> 1) & 0x04);
}

static uint8_t load_move(
  const tt_entry_t *entry,
  move_t *move
)
{
  uint8_t code = stored_move_code(entry);

  if (code == TT_MOVE_NONE) {
    return 0;
  }

  uint8_t from = entry->from_code & 0x77;
  uint8_t to = entry->to_code & 0x77;
  uint8_t side = POSITION_SIDE;
  uint8_t piece = BOARD[from];
  uint8_t target = BOARD[to];

  uint8_t piece_type = PIECE_TYPE(piece);
  uint8_t flags = MF_QUIET;

  if (target != PIECE_EMPTY) {
    flags |= MF_CAPTURE;
  }

  if (code != TT_MOVE_NORMAL) {
    if (piece_type != PIECE_PAWN) {
      return 0;
    }

    if (
      (side == COLOR_WHITE && SQUARE_RANK(to) != 7) ||
      (side == COLOR_BLACK && SQUARE_RANK(to) != 0)
    ) {
      return 0;
    }

    flags |= MF_PROMO;

    switch (code) {
      case TT_MOVE_PROMO_QUEEN:
        flags |= MF_PROMO_QUEEN;
        break;

      case TT_MOVE_PROMO_ROOK:
        flags |= MF_PROMO_ROOK;
        break;

      case TT_MOVE_PROMO_BISHOP:
        flags |= MF_PROMO_BISHOP;
        break;

      case TT_MOVE_PROMO_KNIGHT:
        flags |= MF_PROMO_KNIGHT;
        break;

      default:
        return 0;
    }
  }
  else if (piece_type == PIECE_PAWN) {
    if (
      (side == COLOR_WHITE && SQUARE_RANK(to) == 7) ||
      (side == COLOR_BLACK && SQUARE_RANK(to) == 0)
    ) {
      return 0;
    }

    if (
      target == PIECE_EMPTY &&
      to == POSITION_EP_SQUARE
    ) {
      uint8_t is_ep =
        side == COLOR_WHITE
          ? to == from + 15 || to == from + 17
          : from == to + 15 || from == to + 17;

      if (is_ep) {
        flags |= MF_CAPTURE | MF_EP;
      }
    }

    if (
      (side == COLOR_WHITE && to == from + 32) ||
      (side == COLOR_BLACK && from == to + 32)
    ) {
      flags |= MF_DPUSH;
    }
  }
  else if (
    piece_type == PIECE_KING &&
    (to == from + 2 || from == to + 2)
  ) {
    flags |= MF_CASTLE;
  }

  move->from = from;
  move->to = to;
  move->flags = flags;
  move->score = 0;

  return 1;
}

static uint8_t entry_depth(const tt_entry_t *entry)
{
  return
    ((entry->meta & TT_META_DEPTH_MASK) >>
      TT_META_DEPTH_SHIFT) + 1;
}

static uint8_t replacement_quality(
  uint8_t depth,
  uint8_t bound
)
{
  // exact bounds are a bit more valuable
  return depth + (bound == TT_BOUND_EXACT ? 1 : 0);
}

static uint8_t should_replace(
  const tt_entry_t *entry,
  uint8_t depth,
  uint8_t bound
)
{
  uint8_t old_bound =
    entry->meta & TT_META_BOUND_MASK;

  if (old_bound == TT_BOUND_NONE) {
    return 1;
  }

  uint8_t old_depth = entry_depth(entry);
  uint8_t new_quality =
    replacement_quality(depth, bound);
  uint8_t old_quality =
    replacement_quality(old_depth, old_bound);

  if (entry->lock == HASH.part[1]) {
    return new_quality >= old_quality;
  }

  // new entries are a bit better to keep
  return new_quality + 1 >= old_quality;
}

void tt_clear(void)
{
  memset(
    TT_TABLE,
    0,
    CE_SIZE_TRANSPOSITION_TABLE
  );
}

void tt_probe(
  uint8_t ply,
  tt_probe_t *result
)
{
  const tt_entry_t *entry = current_entry();
  uint8_t bound =
    entry->meta & TT_META_BOUND_MASK;

  result->hit = 0;

  if (
    bound == TT_BOUND_NONE ||
    entry->lock != HASH.part[1]
  ) {
    return;
  }

  result->score = load_score(entry, ply);
  result->depth = entry_depth(entry);
  result->bound = bound;
  result->has_move =
    load_move(entry, &result->move);

  result->hit = 1;
}

void tt_store(
  uint8_t depth,
  uint8_t ply,
  eval_t score,
  uint8_t bound,
  const move_t *move,
  uint8_t has_move
)
{
  tt_entry_t *entry = current_entry();

  if (!should_replace(entry, depth, bound)) {
    return;
  }

  entry->lock = HASH.part[1];

  store_score(entry, score, ply);
  store_move(entry, move, has_move);

  entry->meta =
    ((depth - 1) << TT_META_DEPTH_SHIFT) |
    bound;
}
