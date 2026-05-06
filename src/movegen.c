#include <stdint.h>
#include <debug.h>

#include "types.h"
#include "utils.h"
#include "movegen.h"

State state;

Move move_pool[MAX_PLY * SAFE_MOVES_PER_PLY];

static int8_t w_pawn_capture_offsets[2] = {NE_OFFSET, NW_OFFSET};
static int8_t b_pawn_capture_offsets[2] = {SE_OFFSET, SW_OFFSET};
static int8_t knight_offsets[8] = {-14, -18, -31, -33, 14, 18, 31, 33};
static int8_t king_offsets[8] = {N_OFFSET, NE_OFFSET, E_OFFSET, SE_OFFSET, 
                                 S_OFFSET, SW_OFFSET, W_OFFSET, NW_OFFSET};

INLINE Move *add_move(Square from_square, Square to_square, Flags flags, Move *move_list) {
  uint8_t *move_block = (uint8_t *)move_list;

  // Write directly to memory in 8 bit blocks (Little-endian order)
  // This avoids bit shifting 24-bit data, which the eZ80 can't do natively
  move_block[0] = flags;
  move_block[1] = to_square;
  move_block[2] = from_square;

  return move_list + 1;
}

INLINE Move *generate_stepping_captures(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!IS_OFF_BOARD(target)) {
    Piece target_piece = state->board[target];
    if (target_piece != EMPTY) {
      if (GET_COLOR(target_piece) != state->side_to_move) {
        move_list = add_move(square, target, 0, move_list);
      }
    }
  }

  return move_list;
}

INLINE Move *generate_sliding_captures(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  Piece *board = state->board;
  while (!IS_OFF_BOARD(target)) {
    Piece target_piece = board[target];
    if (target_piece == EMPTY) {
      target += offset;
      continue;
    }

    else {
      if (GET_COLOR(target_piece) != state->side_to_move) {
        move_list = add_move(square, target, 0, move_list);
      }

      break;
    }
  }

  return move_list;
}

static Move *generate_pawn_captures(State *state, Square square, Move *move_list) {
  Color my_color = state->side_to_move;
  Square target;
  for (int i = 0; i < 2; i++) {
    if (my_color == WHITE) target = square + w_pawn_capture_offsets[i];
    else target = square + b_pawn_capture_offsets[i];

    if (!IS_OFF_BOARD(target)) {
      if (target == state->en_passant_target && state->en_passant_legal) {
        move_list = add_move(square, target, CREATE_FLAGS(0, 1), move_list);
      }

      else {
        Piece target_piece = state->board[target];
        if (target_piece != EMPTY) {
          if (GET_COLOR(target_piece) != state->side_to_move) {
            if (target < 16) {
              move_list = add_move(square, target, CREATE_FLAGS(W_QUEEN, 0), move_list);
              move_list = add_move(square, target, CREATE_FLAGS(W_ROOK, 0), move_list);
              move_list = add_move(square, target, CREATE_FLAGS(W_BISHOP, 0), move_list);
              move_list = add_move(square, target, CREATE_FLAGS(W_KNIGHT, 0), move_list);
            }

            else if (target >= 112) {
              move_list = add_move(square, target, CREATE_FLAGS(B_QUEEN, 0), move_list);
              move_list = add_move(square, target, CREATE_FLAGS(B_ROOK, 0), move_list);
              move_list = add_move(square, target, CREATE_FLAGS(B_BISHOP, 0), move_list);
              move_list = add_move(square, target, CREATE_FLAGS(B_KNIGHT, 0), move_list);
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

static Move *generate_knight_captures(State *state, Square square, Move *move_list) {
  const int8_t *offset_ptr = knight_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures(state, square, *offset_ptr++, move_list);
  }

  return move_list;
}

static Move *generate_bishop_captures(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_captures(state, square, NE_OFFSET, move_list);
  move_list = generate_sliding_captures(state, square, SE_OFFSET, move_list);
  move_list = generate_sliding_captures(state, square, SW_OFFSET, move_list);
  move_list = generate_sliding_captures(state, square, NW_OFFSET, move_list);

  return move_list;
}

static Move *generate_rook_captures(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_captures(state, square, N_OFFSET, move_list);
  move_list = generate_sliding_captures(state, square, E_OFFSET, move_list);
  move_list = generate_sliding_captures(state, square, S_OFFSET, move_list);
  move_list = generate_sliding_captures(state, square, W_OFFSET, move_list);

  return move_list;
}

static Move *generate_queen_captures(State *state, Square square, Move *move_list) {
  move_list = generate_bishop_captures(state, square, move_list);
  move_list = generate_rook_captures(state, square, move_list);

  return move_list;
}

static Move *generate_king_captures(State *state, Square square, Move *move_list) {
  const int8_t *offset_ptr = king_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures(state, square, *offset_ptr++, move_list);
  }

  return move_list;
}

INLINE Move *generate_stepping_moves(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!IS_OFF_BOARD(target)) {
    Piece target_piece = state->board[target];
    if (target_piece == EMPTY) {
      move_list = add_move(square, target, 0, move_list);
    }
  }

  return move_list;
}

INLINE Move *generate_sliding_moves(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  Piece *board = state->board;
  while (!IS_OFF_BOARD(target)) {
    Piece target_piece = board[target];
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

static Move *generate_pawn_moves(State *state, Square square, Move *move_list) {
  if (state->side_to_move == WHITE) {
    Square target = square + N_OFFSET;
    if (state->board[target] == EMPTY) {
      // case where pawn is not about to promote
      if (target >= 16) {
        move_list = add_move(square, target, 0, move_list);
        
        // case where pawn can move 2 squares
        if (96 <= square && square < 112) {
          if (state->board[target + N_OFFSET] == EMPTY)
            move_list = add_move(square, target + N_OFFSET, 0, move_list);
        }
      }
      
      // case where pawn is about to promote
      else {
        move_list = add_move(square, target, CREATE_FLAGS(W_QUEEN, 0), move_list);
        move_list = add_move(square, target, CREATE_FLAGS(W_ROOK, 0), move_list);
        move_list = add_move(square, target, CREATE_FLAGS(W_BISHOP, 0), move_list);
        move_list = add_move(square, target, CREATE_FLAGS(W_KNIGHT, 0), move_list);
      }
    }
  }

  else {
    Square target = square + S_OFFSET;
    if (state->board[target] == EMPTY) {
      // case where pawn is not about to promote
      if (target < 112) {
        move_list = add_move(square, target, 0, move_list);
        
        // case where pawn can move 2 squares
        if (16 <= square && square < 32) {
          if (state->board[target + S_OFFSET] == EMPTY)
            move_list = add_move(square, target + S_OFFSET, 0, move_list);
        }
      }
      
      // case where pawn is about to promote
      else {
        move_list = add_move(square, target, CREATE_FLAGS(B_QUEEN, 0), move_list);
        move_list = add_move(square, target, CREATE_FLAGS(B_ROOK, 0), move_list);
        move_list = add_move(square, target, CREATE_FLAGS(B_BISHOP, 0), move_list);
        move_list = add_move(square, target, CREATE_FLAGS(B_KNIGHT, 0), move_list);
      }
    }
  }

  return move_list;
}

static Move *generate_knight_moves(State *state, Square square, Move *move_list) {
  const int8_t *offset_ptr = knight_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_moves(state, square, *offset_ptr++, move_list);
  }

  return move_list;
}

static Move *generate_bishop_moves(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_moves(state, square, NE_OFFSET, move_list);
  move_list = generate_sliding_moves(state, square, SE_OFFSET, move_list);
  move_list = generate_sliding_moves(state, square, SW_OFFSET, move_list);
  move_list = generate_sliding_moves(state, square, NW_OFFSET, move_list);

  return move_list;
}

static Move *generate_rook_moves(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_moves(state, square, N_OFFSET, move_list);
  move_list = generate_sliding_moves(state, square, E_OFFSET, move_list);
  move_list = generate_sliding_moves(state, square, S_OFFSET, move_list);
  move_list = generate_sliding_moves(state, square, W_OFFSET, move_list);

  return move_list;
}

static Move *generate_queen_moves(State *state, Square square, Move *move_list) {
  move_list = generate_bishop_moves(state, square, move_list);
  move_list = generate_rook_moves(state, square, move_list);

  return move_list;
}

static Move *generate_king_moves(State *state, Square square, Move *move_list) {
  Color my_color = state->side_to_move;

  const int8_t *offset_ptr = king_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_moves(state, square, *offset_ptr++, move_list);
  }

  if (my_color == WHITE) {
    if (state->w_kingside_castle) {
      if (state->board[square + E_OFFSET] == EMPTY && 
          state->board[square + E_OFFSET + E_OFFSET] == EMPTY) {
          move_list = add_move(square, square + E_OFFSET + E_OFFSET, 0, move_list);
        }
    }

    if (state->w_queenside_castle) {
      if (state->board[square + W_OFFSET] == EMPTY && 
          state->board[square + W_OFFSET + W_OFFSET] == EMPTY &&
          state->board[square + W_OFFSET + W_OFFSET + W_OFFSET] == EMPTY) {
          move_list = add_move(square, square + W_OFFSET + W_OFFSET, 0, move_list);
        }
    }
  }

  else {
    if (state->b_kingside_castle) {
      if (state->board[square + E_OFFSET] == EMPTY && 
          state->board[square + E_OFFSET + E_OFFSET] == EMPTY) {
          move_list = add_move(square, square + E_OFFSET + E_OFFSET, 0, move_list);
        }
    }

    if (state->b_queenside_castle) {
      if (state->board[square + W_OFFSET] == EMPTY && 
          state->board[square + W_OFFSET + W_OFFSET] == EMPTY &&
          state->board[square + W_OFFSET + W_OFFSET + W_OFFSET] == EMPTY) {
          move_list = add_move(square, square + W_OFFSET + W_OFFSET, 0, move_list);
        }
    }
  }

  return move_list;
}

int main(void) {
  Move *move_list = move_pool; // Initialize local pointer from the global pool
  
  move_list = generate_pawn_captures(&state, 0, move_list);
  move_list = generate_knight_captures(&state, 0, move_list);
  move_list = generate_bishop_captures(&state, 0, move_list);
  move_list = generate_rook_captures(&state, 0, move_list);
  move_list = generate_queen_captures(&state, 0, move_list);
  move_list = generate_king_captures(&state, 0, move_list);
  //dbg_printf("hello");
  
  return 0;
}