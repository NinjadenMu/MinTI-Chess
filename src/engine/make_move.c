/**
 * @file make_move.c
 * 
 * Implementation of make_move.h
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "evaluation.h"
#include "make_move.h"
#include "types.h"

static const uint8_t promotion_types[4] = {
  PIECE_QUEEN,
  PIECE_ROOK,
  PIECE_BISHOP,
  PIECE_KNIGHT
};

// update castling flags based on rook move
static inline uint8_t revoke_rook_castling(
  uint8_t castling,
  uint8_t square
)
{
  if (square == SQUARE(0, 0)) {
    castling &= CASTLE_ALL ^ CASTLE_WHITE_QUEEN;
  }
  else if (square == SQUARE(7, 0)) {
    castling &= CASTLE_ALL ^ CASTLE_WHITE_KING;
  }
  else if (square == SQUARE(0, 7)) {
    castling &= CASTLE_ALL ^ CASTLE_BLACK_QUEEN;
  }
  else if (square == SQUARE(7, 7)) {
    castling &= CASTLE_ALL ^ CASTLE_BLACK_KING;
  }

  return castling;
}

void make_move(const move_t *move, undo_t *undo)
{
  uint8_t *const board = BOARD;
  uint8_t *const piece_index = PIECE_INDEX;
  uint8_t (*const piece_list)[16] = PIECE_LIST;

  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t flags = move->flags;

  uint8_t side = POSITION_SIDE;
  uint8_t side_index = COLOR_INDEX(side);
  uint8_t piece = board[from];
  uint8_t piece_type = PIECE_TYPE(piece);
  uint8_t moving_index = piece_index[from];

  uint8_t castling = POSITION_CASTLING;
  uint8_t halfmove = POSITION_HALFMOVE;
  uint8_t captured = PIECE_EMPTY;
  uint8_t captured_square = SQUARE_NONE;

  undo->ep_square = POSITION_EP_SQUARE;
  undo->castling = castling;
  undo->halfmove = halfmove;

  if (flags & MF_CAPTURE) {
    captured_square = flags & MF_EP
      ? (side == COLOR_WHITE ? to - 16 : to + 16)
      : to;

    uint8_t captured_index = piece_index[captured_square];
    uint8_t captured_color_index;
    uint8_t last_index;
    uint8_t last_square;

    captured = board[captured_square];
    captured_color_index = COLOR_INDEX(PIECE_COLOR(captured));
    last_index = PIECE_COUNT[captured_color_index] - 1;
    last_square = piece_list[captured_color_index][last_index];

    piece_list[captured_color_index][captured_index] = last_square;
    piece_index[last_square] = captured_index;
    PIECE_COUNT[captured_color_index] = last_index;

    board[captured_square] = PIECE_EMPTY;
    piece_index[captured_square] = PIECE_INDEX_NONE;
  }

  undo->captured = captured;
  undo->captured_square = captured_square;

  uint8_t placed_piece = flags & MF_PROMO
    ? side | promotion_types[(flags & MF_PROMO_TYPE_MASK) >> 5]
    : piece;

  evaluation_make_move(
    move,
    piece,
    placed_piece,
    captured,
    captured_square
  );

  board[from] = PIECE_EMPTY;
  board[to] = placed_piece;

  piece_list[side_index][moving_index] = to;
  piece_index[from] = PIECE_INDEX_NONE;
  piece_index[to] = moving_index;

  if (flags & MF_CASTLE) {
    uint8_t rook_from = to > from
      ? to + 1
      : to - 2;
    uint8_t rook_to = (from + to) >> 1;
    uint8_t rook = board[rook_from];
    uint8_t rook_index = piece_index[rook_from];

    board[rook_from] = PIECE_EMPTY;
    board[rook_to] = rook;

    piece_list[side_index][rook_index] = rook_to;
    piece_index[rook_from] = PIECE_INDEX_NONE;
    piece_index[rook_to] = rook_index;
  }

  if (piece_type == PIECE_KING) {
    POSITION_KING_SQUARE[side_index] = to;

    castling &= side == COLOR_WHITE
      ? CASTLE_BLACK_KING | CASTLE_BLACK_QUEEN
      : CASTLE_WHITE_KING | CASTLE_WHITE_QUEEN;
  }
  else if (piece_type == PIECE_ROOK) {
    castling = revoke_rook_castling(castling, from);
  }

  if (PIECE_TYPE(captured) == PIECE_ROOK) {
    castling = revoke_rook_castling(
      castling,
      captured_square
    );
  }

  POSITION_CASTLING = castling;

  if (flags & MF_DPUSH) {
    POSITION_EP_SQUARE = (from + to) >> 1;
  }
  else {
    POSITION_EP_SQUARE = SQUARE_NONE;
  }

  if (
    piece_type == PIECE_PAWN ||
    captured != PIECE_EMPTY
  ) {
    POSITION_HALFMOVE = 0;
  }
  else {
    POSITION_HALFMOVE = halfmove + 1;
  }

  POSITION_SIDE = OPPOSITE_COLOR(side);
}

void unmake_move(const move_t *move, const undo_t *undo)
{
  uint8_t *const board = BOARD;
  uint8_t *const piece_index = PIECE_INDEX;
  uint8_t (*const piece_list)[16] = PIECE_LIST;

  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t flags = move->flags;

  uint8_t side = OPPOSITE_COLOR(POSITION_SIDE);
  uint8_t side_index = COLOR_INDEX(side);
  uint8_t moving_index = piece_index[to];
  uint8_t placed_piece = board[to];
  uint8_t original_piece = flags & MF_PROMO
    ? side | PIECE_PAWN
    : placed_piece;

  evaluation_unmake_move(
    move,
    original_piece,
    placed_piece,
    undo->captured,
    undo->captured_square
  );

  board[to] = PIECE_EMPTY;
  board[from] = original_piece;

  piece_list[side_index][moving_index] = from;
  piece_index[to] = PIECE_INDEX_NONE;
  piece_index[from] = moving_index;

  if (flags & MF_CASTLE) {
    uint8_t rook_from = to > from
      ? to + 1
      : to - 2;
    uint8_t rook_to = (from + to) >> 1;
    uint8_t rook = board[rook_to];
    uint8_t rook_index = piece_index[rook_to];

    board[rook_to] = PIECE_EMPTY;
    board[rook_from] = rook;

    piece_list[side_index][rook_index] = rook_from;
    piece_index[rook_to] = PIECE_INDEX_NONE;
    piece_index[rook_from] = rook_index;
  }

  if (PIECE_TYPE(original_piece) == PIECE_KING) {
    POSITION_KING_SQUARE[side_index] = from;
  }

  if (undo->captured != PIECE_EMPTY) {
    uint8_t captured_color_index =
      COLOR_INDEX(PIECE_COLOR(undo->captured));
    uint8_t append_index =
      PIECE_COUNT[captured_color_index];

    piece_list[captured_color_index][append_index] =
      undo->captured_square;
    piece_index[undo->captured_square] = append_index;
    PIECE_COUNT[captured_color_index] = append_index + 1;

    board[undo->captured_square] = undo->captured;
  }

  POSITION_EP_SQUARE = undo->ep_square;
  POSITION_CASTLING = undo->castling;
  POSITION_HALFMOVE = undo->halfmove;
  POSITION_SIDE = side;
}
