#ifndef BOARD_H
#define BOARD_H

#include "types.h"

extern State state;

// Utilities for manipulating board state
void make_move(Move move);
void unmake_move(Move move);
void reset_board();

// Function-like macro for querying board
#define BOARD_GET_PIECE(square) (state.board[(square)])

// Function-like macros for getting game state attributes
#define BOARD_SIDE_TO_MOVE() (state.side_to_move)
#define BOARD_EN_PASSANT_LEGAL() (state.en_passant_legal)
#define BOARD_EN_PASSANT_TARGET() (state.en_passant_target)
#define BOARD_W_KINGSIDE_CASTLE() (state.w_kingside_castle)
#define BOARD_B_KINGSIDE_CASTLE() (state.b_kingside_castle)
#define BOARD_W_QUEENSIDE_CASTLE() (state.w_queenside_castle)
#define BOARD_B_QUEENSIDE_CASTLE() (state.b_queenside_castle)

// Function-like macros for accessing piece list
#define BOARD_W_PIECE_LIST() (state.piece_list.w_piece_list)
#define BOARD_B_PIECE_LIST() (state.piece_list.b_piece_list)
#define BOARD_W_COUNT() (state.piece_list.w_count)
#define BOARD_B_COUNT() (state.piece_list.b_count)

// Bitwise helper macros for move generation
#define BOARD_IS_OFF_BOARD(square) ((square) & 0x88)
#define BOARD_GET_PIECE_COLOR(piece) (((piece) & 1) ? WHITE : BLACK)
#define BOARD_CREATE_FLAGS(promotion_piece_type, en_passant) ((promotion_piece_type) << 4 | (en_passant) << 3)

#endif