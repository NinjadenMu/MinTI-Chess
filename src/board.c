#include <stdint.h>
#include <debug.h>
#include <stdbool.h>

#include "types.h"
#include "consts.h"
#include "board.h"

State state;

static const State initial_state = {
  .board = {
    BOARD_PACK(B_ROOK, 0), BOARD_PACK(B_KNIGHT, 1), BOARD_PACK(B_BISHOP, 2), BOARD_PACK(B_QUEEN, 3), 
    BOARD_PACK(B_KING, 4), BOARD_PACK(B_BISHOP, 5), BOARD_PACK(B_KNIGHT, 6), BOARD_PACK(B_ROOK, 7),
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,

    BOARD_PACK(B_PAWN, 8), BOARD_PACK(B_PAWN, 9), BOARD_PACK(B_PAWN, 10), BOARD_PACK(B_PAWN, 11), 
    BOARD_PACK(B_PAWN, 12), BOARD_PACK(B_PAWN, 13), BOARD_PACK(B_PAWN, 14), BOARD_PACK(B_PAWN, 15),
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
        
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
        
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
        
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
        
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
        
    BOARD_PACK(W_PAWN, 8), BOARD_PACK(W_PAWN, 9), BOARD_PACK(W_PAWN, 10), BOARD_PACK(W_PAWN, 11), 
    BOARD_PACK(W_PAWN, 12), BOARD_PACK(W_PAWN, 13), BOARD_PACK(W_PAWN, 14), BOARD_PACK(W_PAWN, 15),
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY,
        
    BOARD_PACK(W_ROOK, 0), BOARD_PACK(W_KNIGHT, 1), BOARD_PACK(W_BISHOP, 2), BOARD_PACK(W_QUEEN, 3), 
    BOARD_PACK(W_KING, 4), BOARD_PACK(W_BISHOP, 5), BOARD_PACK(W_KNIGHT, 6), BOARD_PACK(W_ROOK, 7),
    EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY, EMPTY
  },
    
  .piece_list = {
    .w_piece_list = {
      {W_ROOK, 112}, {W_KNIGHT, 113}, {W_BISHOP, 114}, {W_QUEEN, 115},
      {W_KING, 116}, {W_BISHOP, 117}, {W_KNIGHT, 118}, {W_ROOK, 119},
      {W_PAWN, 96},  {W_PAWN, 97},  {W_PAWN, 98},  {W_PAWN, 99},
      {W_PAWN, 100}, {W_PAWN, 101}, {W_PAWN, 102}, {W_PAWN, 103}
    },
    .b_piece_list = {
      {B_ROOK, 0}, {B_KNIGHT, 1}, {B_BISHOP, 2}, {B_QUEEN, 3},
      {B_KING, 4}, {B_BISHOP, 5}, {B_KNIGHT, 6}, {B_ROOK, 7},
      {B_PAWN, 16}, {B_PAWN, 17}, {B_PAWN, 18}, {B_PAWN, 19},
      {B_PAWN, 20}, {B_PAWN, 21}, {B_PAWN, 22}, {B_PAWN, 23}
    },
    .w_count = 16,
    .b_count = 16
  },

  .side_to_move = WHITE,

  .en_passant_target = 0,
  .en_passant_legal = false,

  .w_kingside_castle = true,
  .w_queenside_castle = true,
  .b_kingside_castle = true,
  .b_queenside_castle = true
};

void reset_board() {
    state = initial_state;
}

bool square_is_attacked(Square square) {
  Piece enemy_pawn, enemy_knight, enemy_bishop, enemy_rook, enemy_queen, enemy_king;
  int8_t pawn_offset1, pawn_offset2;
  if (BOARD_GET_SIDE_TO_MOVE() == WHITE) {
    enemy_pawn = B_PAWN;
    enemy_knight = B_KNIGHT;
    enemy_bishop = B_BISHOP;
    enemy_rook = B_ROOK;
    enemy_queen = B_QUEEN;
    enemy_king = B_KING;

    pawn_offset1 = w_pawn_capture_offsets[0];
    pawn_offset2 = w_pawn_capture_offsets[1];
  }
  else {
    enemy_pawn = W_PAWN;
    enemy_knight = W_KNIGHT;
    enemy_bishop = W_BISHOP;
    enemy_rook = W_ROOK;
    enemy_queen = W_QUEEN;
    enemy_king = W_KING;

    pawn_offset1 = b_pawn_capture_offsets[0];
    pawn_offset2 = b_pawn_capture_offsets[1];
  }

  Square target;

  // check if enemy pawns are attacking
  target = square + pawn_offset1;
  if (!BOARD_IS_OFF_BOARD(target) && BOARD_GET_PIECE(target) == enemy_pawn) return true;
    
  target = square + pawn_offset2;
  if (!BOARD_IS_OFF_BOARD(target) && BOARD_GET_PIECE(target) == enemy_pawn) return true;

  // check if enemy knights are attacking
  #pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    target = square + knight_offsets[i];
    if (!BOARD_IS_OFF_BOARD(target) && BOARD_GET_PIECE(target) == enemy_knight) return true;
  }

  // check if enemy king is attacking
  #pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    target = square + king_offsets[i];
    if (!BOARD_IS_OFF_BOARD(target) && BOARD_GET_PIECE(target) == enemy_king) return true;
  }

  // Check if enemy bishop or queen is attacking diagonally
  #pragma unroll
  for (uint8_t i = 0; i < 4; i++) {
    int8_t offset = bishop_offsets[i];
    target = square + offset;
        
    while (!BOARD_IS_OFF_BOARD(target)) {
      Piece piece = BOARD_GET_PIECE(target);
      if (piece != EMPTY) {
        if (piece == enemy_bishop || piece == enemy_queen) return true;
        break; // Blocked by some other piece
      }
      target += offset;
    }
  }

  // Check if enemy rook or queen is attacking orthogonally
  #pragma unroll
  for (uint8_t i = 0; i < 4; i++) {
    int8_t offset = rook_offsets[i];
    target = square + rook_offsets[i];
        
    while (!BOARD_IS_OFF_BOARD(target)) {
      Piece piece = BOARD_GET_PIECE(target);
      if (piece != EMPTY) {
        if (piece == enemy_rook || piece == enemy_queen) return true;
        break; // Blocked by some other piece
      }
      target += offset;
    }
  }

  return false;
}

bool make_move(Move move, UndoInfo *undo_info) {
  // Read directly from memory in 8 bit blocks (little-endian order)
  // This avoids bit shifting 24-bit data, which the eZ80 can't do natively
  uint8_t *move_block = (uint8_t *)&move;

  Flags flags = move_block[0];
  Square to_square = move_block[1];
  Square from_square = move_block[2];

  PackedPiece from_packed_piece = BOARD_GET_PACKED_PIECE(from_square);
  Color from_color = BOARD_GET_PIECE_COLOR(from_packed_piece);

  // information about to_square will only be computed if needed

  if (!flags) {
    BOARD_SET_PIECE(to_square, from_packed_piece);
    BOARD_SET_PIECE(from_square, EMPTY);

    PieceInfo *from_piece_list;
    if (from_color == WHITE) piece_list = BOARD_GET_W_PIECE_LIST();
    else piece_list = BOARD_GET_B_PIECE_LIST();

    from_piece_list[BOARD_DECODE_INDEX(from_packed_piece)].square = to_square;
  }

  if (BOARD_GET_CAPTURE(flags)) {
    BOARD_SET_PIECE(to_square, from_packed_piece);
    BOARD_SET_PIECE(from_square, EMPTY);

    PackedPiece to_packed_piece = BOARD_GET_PACKED_PIECE(to_square);
    undo_info->captured_packed_piece = to_packed_piece;

    PieceInfo *from_piece_list;
    PieceInfo *to_piece_list;
    if (from_color == WHITE) {
      from_piece_list = BOARD_GET_W_PIECE_LIST();
      // color of captured piece must be the opposite of `from_color`
      to_piece_list = BOARD_GET_B_PIECE_LIST();
    }
    else {
      from_piece_list = BOARD_GET_B_PIECE_LIST();
      to_piece_list = BOARD_GET_W_PIECE_LIST();
    }

    from_piece_list[BOARD_DECODE_INDEX(from_packed_piece)].square = to_square;
    to_piece_list[BOARD_DECODE_INDEX(to_packed_piece)].piece = EMPTY;

    BOARD_SET_EN_PASSANT_LEGAL(false);

    if (BOARD_DECODE_PIECE(from_packed_piece) <= B_PAWN) {
      if (from_color == WHITE && to_square - from_square == N_OFFSET + N_OFFSET) {
        BOARD_SET_EN_PASSANT_LEGAL(true);
        BOARD_SET_EN_PASSANT_TARGET(to_square - N_OFFSET);
      }
      else if (from_color == BLACK && to_square - from_square == S_OFFSET + S_OFFSET) {
        BOARD_SET_EN_PASSANT_LEGAL(true);
        BOARD_SET_EN_PASSANT_TARGET(to_square - S_OFFSET);
      }
    }
  }

  if (BOARD_GET_CASTLE(flags)) {
    // kingside castle
    if (to_square > from_square) {
      if (!square_is_attacked(from_square + E_OFFSET) && !square_is_attacked(from_square + E_OFFSET + E_OFFSET)) {

      }
      else {
        return false;
      }
    }
  }

  return true;
}