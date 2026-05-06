#include <stdint.h>
#include <debug.h>

#include "types.h"
#include "utils.h"
#include "movegen.h"

MoveListStack move_list_stack;

static int8_t w_pawn_capture_offsets[2] = {NE_OFFSET, NW_OFFSET};
static int8_t b_pawn_capture_offsets[2] = {SE_OFFSET, SW_OFFSET};
static int8_t knight_offsets[8] = {-14, -18, -31, -33, 14, 18, 31, 33};
static int8_t king_offsets[8] = {N_OFFSET, NE_OFFSET, E_OFFSET, SE_OFFSET, 
                                 S_OFFSET, SW_OFFSET, W_OFFSET, NW_OFFSET};

INLINE Move create_move(Square from_square, Square to_square, Flags flags) {
  return ((Move)from_square << 16) | ((Move)to_square << 8) | flags;
}

INLINE Move *generate_stepping_captures(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!IS_OFF_BOARD(target)) {
    Piece target_piece = state->board[target];
    if (target_piece != EMPTY) {
      if (GET_COLOR(target_piece) != state->side_to_move) {
        *move_list++ = create_move(square, target, 0);
      }
    }
  }

  return move_list;
}

INLINE Move *generate_sliding_captures(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  while (!IS_OFF_BOARD(target)) {
    Piece target_piece = state->board[target];
    if (target_piece == EMPTY) {
      target += offset;
      continue;
    }

    else {
      if (GET_COLOR(target_piece) != state->side_to_move) {
        *move_list++ = create_move(square, target, 0);
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
        *move_list++ = create_move(square, target, CREATE_FLAGS(0, 1));
      }

      else {
        Piece target_piece = state->board[target];
        if (target_piece != EMPTY) {
          if (GET_COLOR(target_piece) != state->side_to_move) {
            if (target < 16) {
              *move_list++ = create_move(square, target, CREATE_FLAGS(W_QUEEN, 0));
              *move_list++ = create_move(square, target, CREATE_FLAGS(W_ROOK, 0));
              *move_list++ = create_move(square, target, CREATE_FLAGS(W_BISHOP, 0));
              *move_list++ = create_move(square, target, CREATE_FLAGS(W_KNIGHT, 0));
            }

            else if (target >= 112) {
              *move_list++ = create_move(square, target, CREATE_FLAGS(B_QUEEN, 0));
              *move_list++ = create_move(square, target, CREATE_FLAGS(B_ROOK, 0));
              *move_list++ = create_move(square, target, CREATE_FLAGS(B_BISHOP, 0));
              *move_list++ = create_move(square, target, CREATE_FLAGS(B_KNIGHT, 0));
            }

            else {
              *move_list++ = create_move(square, target, 0);
            }
          }
        }
      }
    }
  }

  return move_list;
}

static Move *generate_knight_captures(State *state, Square square, Move *move_list) {
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures(state, square, knight_offsets[i], move_list);
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
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures(state, square, king_offsets[i], move_list);
  }

  return move_list;
}

int main(void) {
  State state;
  Move move_list[256];
  
  generate_pawn_captures(&state, 0, move_list);
  generate_knight_captures(&state, 0, move_list);
  generate_bishop_captures(&state, 0, move_list);
  generate_rook_captures(&state, 0, move_list);
  generate_queen_captures(&state, 0, move_list);
  generate_king_captures(&state, 0, move_list);
  //dbg_printf("hello");
  return 0;
}