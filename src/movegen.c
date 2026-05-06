#include <stdint.h>
#include <debug.h>

#include "types.h"
#include "utils.h"
#include "movegen.h"

static int8_t knight_offsets[8] = {-14, -18, -31, -33, 14, 18, 31, 33};
static int8_t bishop_offsets[4] = {NE_OFFSET, SE_OFFSET, SW_OFFSET, NW_OFFSET};
static int8_t rook_offsets[4] = {N_OFFSET, E_OFFSET, S_OFFSET, W_OFFSET};
static int8_t king_offsets[8] = {N_OFFSET, NE_OFFSET, NE_OFFSET, SE_OFFSET, 
                                 S_OFFSET, SW_OFFSET, W_OFFSET, NW_OFFSET};

INLINE Move create_move(Square from_square, Square to_square, Flags flags) {
  return ((Move)from_square << 16) | ((Move)to_square << 8) | flags;
}

Inline Move *generate_pawn_captures(State *state, Square square, Move *move_list) {
  Color my_color = GET_COLOR(state->board[square]);

  if (state->en_passant_legal) {
    if (state->en_passant_target > 63 && my_color == BLACK) {

    }

    else if (state->en_passant_target <= 63 && my_color == WHITE) {

    }
  }
}

INLINE Move *generate_knight_captures(State *state, Square square, Move *move_list) {
  Color my_color = GET_COLOR(state->board[square]);
  for (uint8_t i = 0; i < 8; i++) {
    Square target = square + knight_offsets[i];

    if (!IS_OFF_BOARD(target)) {
      Piece target_piece = state->board[target];
      if (target_piece != EMPTY) {
        if (GET_COLOR(target_piece) != my_color) {
          *move_list++ = create_move(square, target, 0);
        }
      }
    }
  }

  return move_list;
}

INLINE Move *generate_bishop_captures(State *state, Square square, Move *move_list) {
  Color my_color = GET_COLOR(state->board[square]);
  for (uint8_t i = 0; i < 4; i++) {
    int8_t offset = bishop_offsets[i];

    Square target = square + offset;

    while (!IS_OFF_BOARD(target)) {
      Piece target_piece = state->board[target];
      if (target_piece == EMPTY) {
        target += offset;
        continue;
      }

      else {
        if (GET_COLOR(target_piece) != my_color) {
          *move_list++ = create_move(square, target, 0);
        }

        break;
      }
    }
  }

  return move_list;
}

INLINE Move *generate_rook_captures(State *state, Square square, Move *move_list) {
  Color my_color = GET_COLOR(state->board[square]);
  for (uint8_t i = 0; i < 4; i++) {
    int8_t offset = rook_offsets[i];

    Square target = square + offset;

    while (!IS_OFF_BOARD(target)) {
      Piece target_piece = state->board[target];
      if (target_piece == EMPTY) {
        target += offset;
        continue;
      }

      else {
        if (GET_COLOR(target_piece) != my_color) {
          *move_list++ = create_move(square, target, 0);
        }

        break;
      }
    }
  }

  return move_list;
}

INLINE Move *generate_queen_captures(State *state, Square square, Move *move_list) {
  move_list = generate_bishop_captures(state, square, move_list);

  move_list = generate_rook_captures(state, square, move_list);

  return move_list;
}

INLINE Move *generate_king_captures(State *state, Square square, Move *move_list) {
  Color my_color = GET_COLOR(state->board[square]);
  for (uint8_t i = 0; i < 8; i++) {
    Square target = square + king_offsets[i];

    if (!IS_OFF_BOARD(target)) {
      Piece target_piece = state->board[target];
      if (target_piece != EMPTY) {
        if (GET_COLOR(target_piece) != my_color) {
          *move_list++ = create_move(square, target, 0);
        }
      }
    }
  }

  return move_list;
}


