#include <stdint.h>
#include <debug.h>

#include "types.h"
#include "consts.h"
#include "board.h"
#include "movegen.h"

const int8_t w_pawn_capture_offsets[2] = {NE_OFFSET, NW_OFFSET};
const int8_t b_pawn_capture_offsets[2] = {SE_OFFSET, SW_OFFSET};
const int8_t knight_offsets[8] = {-14, -18, -31, -33, 14, 18, 31, 33};
const int8_t bishop_offsets[4] = {NE_OFFSET, SE_OFFSET, SW_OFFSET, NW_OFFSET};
const int8_t rook_offsets[4] = {N_OFFSET, E_OFFSET, S_OFFSET, W_OFFSET};
const int8_t king_offsets[8] = {N_OFFSET, NE_OFFSET, E_OFFSET, SE_OFFSET, 
                                 S_OFFSET, SW_OFFSET, W_OFFSET, NW_OFFSET};

static __attribute__((noinline)) Move *add_move(Square from_square, Square to_square, Flags flags, Move *move_list) {
  dbg_printf("From: %hhu To: %hhu\n", from_square, to_square);
  uint8_t *move_block = (uint8_t *)move_list;

  // Write directly to memory in 8 bit blocks (little-endian order)
  // This avoids bit shifting 24-bit data, which the eZ80 can't do natively
  move_block[0] = flags;
  move_block[1] = to_square;
  move_block[2] = from_square;

  return move_list + 1;
}

INLINE Move *generate_stepping_captures_at(Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!BOARD_IS_OFF_BOARD(target)) {
    Piece target_piece = BOARD_GET_PIECE(target);
    if (target_piece != EMPTY) {
      if (BOARD_GET_PIECE_COLOR(target_piece) != BOARD_GET_SIDE_TO_MOVE()) {
        move_list = add_move(square, target, 0, move_list);
      }
    }
  }

  return move_list;
}

INLINE Move *generate_sliding_captures_at(Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  while (!BOARD_IS_OFF_BOARD(target)) {
    Piece target_piece = BOARD_GET_PIECE(target);
    if (target_piece == EMPTY) {
      target += offset;
      continue;
    }

    else {
      if (BOARD_GET_PIECE_COLOR(target_piece) != BOARD_GET_SIDE_TO_MOVE()) {
        move_list = add_move(square, target, 0, move_list);
      }

      break;
    }
  }

  return move_list;
}

static Move *generate_pawn_captures_at(Square square, Move *move_list) {
  Color my_color = BOARD_GET_SIDE_TO_MOVE();
  Square target;
  for (int i = 0; i < 2; i++) {
    if (my_color == WHITE) target = square + w_pawn_capture_offsets[i];
    else target = square + b_pawn_capture_offsets[i];

    if (!BOARD_IS_OFF_BOARD(target)) {
      if (target == BOARD_GET_EN_PASSANT_TARGET() && BOARD_GET_EN_PASSANT_LEGAL()) {
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(0, 1, 0, 1), move_list);
      }

      else {
        Piece target_piece = BOARD_GET_PIECE(target);
        if (target_piece != EMPTY) {
          if (BOARD_GET_PIECE_COLOR(target_piece) != BOARD_GET_SIDE_TO_MOVE()) {
            if (target < 16) {
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_QUEEN, 0, 0, 1), move_list);
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_ROOK, 0, 0, 1), move_list);
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_BISHOP, 0, 0, 1), move_list);
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_KNIGHT, 0, 0, 1), move_list);
            }

            else if (target >= 112) {
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_QUEEN, 0, 0, 1), move_list);
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_ROOK, 0, 0, 1), move_list);
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_BISHOP, 0, 0, 1), move_list);
              move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_KNIGHT, 0, 0, 1), move_list);
            }

            else {
              move_list = add_move(square, target, 0, move_list);
            }
          }
        }
      }
    }
  }

  return move_list;
}

static __attribute__((noinline)) Move *generate_knight_captures_at(Square square, Move *move_list) {
  #pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures_at(square, knight_offsets[i], move_list);
  }

  return move_list;
}

static Move *generate_bishop_captures_at(Square square, Move *move_list) {
  move_list = generate_sliding_captures_at(square, NE_OFFSET, move_list);
  move_list = generate_sliding_captures_at(square, SE_OFFSET, move_list);
  move_list = generate_sliding_captures_at(square, SW_OFFSET, move_list);
  move_list = generate_sliding_captures_at(square, NW_OFFSET, move_list);

  return move_list;
}

static Move *generate_rook_captures_at(Square square, Move *move_list) {
  move_list = generate_sliding_captures_at(square, N_OFFSET, move_list);
  move_list = generate_sliding_captures_at(square, E_OFFSET, move_list);
  move_list = generate_sliding_captures_at(square, S_OFFSET, move_list);
  move_list = generate_sliding_captures_at(square, W_OFFSET, move_list);

  return move_list;
}

static Move *generate_queen_captures_at(Square square, Move *move_list) {
  move_list = generate_bishop_captures_at(square, move_list);
  move_list = generate_rook_captures_at(square, move_list);

  return move_list;
}

static Move *generate_king_captures_at(Square square, Move *move_list) {
  #pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures_at(square, king_offsets[i], move_list);
  }

  return move_list;
}

INLINE Move *generate_stepping_moves_at(Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!BOARD_IS_OFF_BOARD(target)) {
    Piece target_piece = BOARD_GET_PIECE(target);
    if (target_piece == EMPTY) {
      move_list = add_move(square, target, 0, move_list);
    }
  }

  return move_list;
}

INLINE Move *generate_sliding_moves_at(Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  while (!BOARD_IS_OFF_BOARD(target)) {
    Piece target_piece = BOARD_GET_PIECE(target);
    if (target_piece == EMPTY) {
      move_list = add_move(square, target, 0, move_list);
      target += offset;
    }

    else {
      break;
    }
  }

  return move_list;
}

static Move *generate_pawn_moves_at(Square square, Move *move_list) {
  if (BOARD_GET_SIDE_TO_MOVE() == WHITE) {
    Square target = square + N_OFFSET;
    if (BOARD_GET_PIECE(target) == EMPTY) {
      // case where pawn is not about to promote
      if (target >= 16) {
        move_list = add_move(square, target, 0, move_list);
        
        // case where pawn can move 2 squares
        if (96 <= square && square < 112) {
          if (BOARD_GET_PIECE(target + N_OFFSET) == EMPTY)
            move_list = add_move(square, target + N_OFFSET, 0, move_list);
        }
      }
      
      // case where pawn is about to promote
      else {
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_QUEEN, 0, 0, 0), move_list);
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_ROOK, 0, 0, 0), move_list);
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_BISHOP, 0, 0, 0), move_list);
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(W_KNIGHT, 0, 0, 0), move_list);
      }
    }
  }

  else {
    Square target = square + S_OFFSET;
    if (BOARD_GET_PIECE(target) == EMPTY) {
      // case where pawn is not about to promote
      if (target < 112) {
        move_list = add_move(square, target, 0, move_list);
        
        // case where pawn can move 2 squares
        if (16 <= square && square < 32) {
          if (BOARD_GET_PIECE(target + S_OFFSET) == EMPTY)
            move_list = add_move(square, target + S_OFFSET, 0, move_list);
        }
      }
      
      // case where pawn is about to promote
      else {
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_QUEEN, 0, 0, 0), move_list);
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_ROOK, 0, 0, 0), move_list);
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_BISHOP, 0, 0, 0), move_list);
        move_list = add_move(square, target, BOARD_CREATE_FLAGS(B_KNIGHT, 0, 0, 0), move_list);
      }
    }
  }

  return move_list;
}

static Move *generate_knight_moves_at(Square square, Move *move_list) {
  #pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_moves_at(square, knight_offsets[i], move_list);
  }

  return move_list;
}

static Move *generate_bishop_moves_at(Square square, Move *move_list) {
  move_list = generate_sliding_moves_at(square, NE_OFFSET, move_list);
  move_list = generate_sliding_moves_at(square, SE_OFFSET, move_list);
  move_list = generate_sliding_moves_at(square, SW_OFFSET, move_list);
  move_list = generate_sliding_moves_at(square, NW_OFFSET, move_list);

  return move_list;
}

static Move *generate_rook_moves_at(Square square, Move *move_list) {
  move_list = generate_sliding_moves_at(square, N_OFFSET, move_list);
  move_list = generate_sliding_moves_at(square, E_OFFSET, move_list);
  move_list = generate_sliding_moves_at(square, S_OFFSET, move_list);
  move_list = generate_sliding_moves_at(square, W_OFFSET, move_list);

  return move_list;
}

static Move *generate_queen_moves_at(Square square, Move *move_list) {
  move_list = generate_bishop_moves_at(square, move_list);
  move_list = generate_rook_moves_at(square, move_list);

  return move_list;
}

static Move *generate_king_moves_at(Square square, Move *move_list) {
  Color my_color = BOARD_GET_SIDE_TO_MOVE();

  #pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_moves_at(square, king_offsets[i], move_list);
  }

  if (my_color == WHITE) {
    if (BOARD_GET_W_KINGSIDE_CASTLE()) {
      if (BOARD_GET_PIECE(square + E_OFFSET) == EMPTY && 
          BOARD_GET_PIECE(square + E_OFFSET + E_OFFSET) == EMPTY) {
          move_list = add_move(square, square + E_OFFSET + E_OFFSET, BOARD_CREATE_FLAGS(0, 0, 1, 0), move_list);
        }
    }

    if (BOARD_GET_W_QUEENSIDE_CASTLE()) {
      if (BOARD_GET_PIECE(square + W_OFFSET) == EMPTY && 
          BOARD_GET_PIECE(square + W_OFFSET + W_OFFSET) == EMPTY &&
          BOARD_GET_PIECE(square + W_OFFSET + W_OFFSET + W_OFFSET) == EMPTY) {
          move_list = add_move(square, square + W_OFFSET + W_OFFSET, BOARD_CREATE_FLAGS(0, 0, 1, 0), move_list);
        }
    }
  }

  else {
    if (BOARD_GET_B_KINGSIDE_CASTLE()) {
      if (BOARD_GET_PIECE(square + E_OFFSET) == EMPTY && 
          BOARD_GET_PIECE(square + E_OFFSET + E_OFFSET) == EMPTY) {
          move_list = add_move(square, square + E_OFFSET + E_OFFSET, BOARD_CREATE_FLAGS(0, 0, 1, 0), move_list);
        }
    }

    if (BOARD_GET_B_QUEENSIDE_CASTLE()) {
      if (BOARD_GET_PIECE(square + W_OFFSET) == EMPTY && 
          BOARD_GET_PIECE(square + W_OFFSET + W_OFFSET) == EMPTY &&
          BOARD_GET_PIECE(square + W_OFFSET + W_OFFSET + W_OFFSET) == EMPTY) {
          move_list = add_move(square, square + W_OFFSET + W_OFFSET, BOARD_CREATE_FLAGS(0, 0, 1, 0), move_list);
        }
    }
  }

  return move_list;
}

Move *generate_moves(Stage stage, Move *move_list) {
  dbg_printf("Entered generate_moves\n");
  uint8_t end;
  PieceInfo *pieces;
  if (BOARD_GET_SIDE_TO_MOVE() == WHITE) {
    pieces = BOARD_GET_W_PIECE_LIST();
    end = BOARD_GET_W_COUNT();
  }
  else {
    pieces = BOARD_GET_B_PIECE_LIST();
    end = BOARD_GET_B_COUNT();
  }

  if (stage == CAPTURES) {
    for (uint8_t i = 0; i < end; i++) {
      dbg_printf("Loop iteration %hhu reached\n", i);
      dbg_printf("move_list: %p\n", move_list);
      Square square = pieces[i].square;
      switch (pieces[i].piece) {
        case W_PAWN:
        case B_PAWN:
          move_list = generate_pawn_captures_at(square, move_list);
          break;
            
        case W_KNIGHT:
        case B_KNIGHT:
          move_list = generate_knight_captures_at(square, move_list);
          break;
            
        case W_BISHOP:
        case B_BISHOP:
          move_list = generate_bishop_captures_at(square, move_list);
          break;
            
        case W_ROOK:
        case B_ROOK:
          move_list = generate_rook_captures_at(square, move_list);
          break;
            
        case W_QUEEN:
        case B_QUEEN:
          move_list = generate_queen_captures_at(square, move_list);
          break;
            
        case W_KING:
        case B_KING:
          move_list = generate_king_captures_at(square, move_list);
          break;
      }
    }
  }
  else {
    for (uint8_t i = 0; i < end; i++) {
      dbg_printf("Loop iteration %hhu reached\n", i);
      dbg_printf("move_list: %p\n", move_list);
      Square square = pieces[i].square;
      switch (pieces[i].piece) {
        case W_PAWN:
        case B_PAWN:
          move_list = generate_pawn_moves_at(square, move_list);
          break;
            
        case W_KNIGHT:
        case B_KNIGHT:
          move_list = generate_knight_moves_at(square, move_list);
          break;
            
        case W_BISHOP:
        case B_BISHOP:
          move_list = generate_bishop_moves_at(square, move_list);
          break;
            
        case W_ROOK:
        case B_ROOK:
          move_list = generate_rook_moves_at(square, move_list);
          break;
            
        case W_QUEEN:
        case B_QUEEN:
          move_list = generate_queen_moves_at(square, move_list);
          break;
            
        case W_KING:
        case B_KING:
          move_list = generate_king_moves_at(square, move_list);
          break;
      }
    }
  }

  return move_list;
}
