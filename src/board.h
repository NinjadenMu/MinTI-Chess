/**
 * @file board.h
 * @brief Game state representation and manipulation via zero-overhead macros
 * 
 * @warning Do NOT access `state` directly
 * 
 * For performance reasons, getter/setter functions and pointers aren't used 
 * As a result, the `state` variable is exposed globally.  However the provided
 * functions and board_* macros should be used to to access `state`.
 */

#ifndef BOARD_H
#define BOARD_H

#include "types.h"

// do not access directly, instead, use provided functions or BOARD_* macros
extern State state;

// Utilities for manipulating board state
bool make_move(Move move, UndoInfo *undo_info);
void unmake_move(Move move, UndoInfo *undo_info);
void reset_board(void);

// Function-like macro for querying board
#define BOARD_GET_PACKED_PIECE(square) (state.board[(square)])
#define BOARD_GET_PIECE(square) (state.board[(square)] & 0xF)
#define BOARD_GET_INDEX(square) ((state.board[(square)] & 0xF0) >> 4)

// Function-like macro for writing board
#define BOARD_SET_PIECE(square, piece) (state.board[(square)] = (piece))

// Function-like macros for getting game state attributes
#define BOARD_GET_SIDE_TO_MOVE() (state.side_to_move)
#define BOARD_GET_EN_PASSANT_LEGAL() (state.en_passant_legal)
#define BOARD_GET_EN_PASSANT_TARGET() (state.en_passant_target)
#define BOARD_GET_W_KINGSIDE_CASTLE() (state.w_kingside_castle)
#define BOARD_GET_B_KINGSIDE_CASTLE() (state.b_kingside_castle)
#define BOARD_GET_W_QUEENSIDE_CASTLE() (state.w_queenside_castle)
#define BOARD_GET_B_QUEENSIDE_CASTLE() (state.b_queenside_castle)

// Function-like macros for setting game state attributes
#define BOARD_SET_SIDE_TO_MOVE(side_to_move) (state.side_to_move = (side_to_move))
#define BOARD_SET_EN_PASSANT_LEGAL(en_passant_legal) (state.en_passant_legal = (en_passant_legal))
#define BOARD_SET_EN_PASSANT_TARGET(en_passant_target) (state.en_passant_target = (en_passant_target))
#define BOARD_SET_W_KINGSIDE_CASTLE(status) (state.w_kingside_castle = (status))
#define BOARD_SET_B_KINGSIDE_CASTLE(status) (state.b_kingside_castle = (status))
#define BOARD_SET_W_QUEENSIDE_CASTLE(status) (state.w_queenside_castle = (status))
#define BOARD_SET_B_QUEENSIDE_CASTLE(status) (state.b_queenside_castle = (status))

// Function-like macros for accessing piece list
#define BOARD_GET_W_PIECE_LIST() (state.piece_list.w_piece_list)
#define BOARD_GET_B_PIECE_LIST() (state.piece_list.b_piece_list)
#define BOARD_GET_W_COUNT() (state.piece_list.w_count)
#define BOARD_GET_B_COUNT() (state.piece_list.b_count)

// Bitwise helper macros for packing and unpacking pieces
#define BOARD_PACK(piece, index) ((index) << 4 | piece)
#define BOARD_DECODE_PIECE(packed_piece) ((packed_piece) & 0xF)
#define BOARD_DECODE_INDEX(packed_piece) (((packed_piece) & 0xF0) >> 4)
#define BOARD_GET_PIECE_COLOR(piece) (((piece) & 1) ? WHITE : BLACK)

// Bitwise helper macros for move generation
#define BOARD_IS_OFF_BOARD(square) ((square) & 0x88)
#define BOARD_CREATE_FLAGS(promotion_piece_type, en_passant, castle, capture) ((promotion_piece_type) << 4 | (en_passant) << 3 | (castle) << 2 | (capture) << 1)

// Bitwise helper macros for decoding flags
#define BOARD_GET_CAPTURE(flags) = (((flags) >> 1) & 0x1)
#define BOARD_GET_CASTLE(flags) (((flags) >> 2) & 0x1)
#define BOARD_GET_EN_PASSANT(flags) (((flags) >> 3) & 0x1)
#define BOARD_GET_PROMOTION_PIECE_TYPE(flags) (((flags) >> 4) & 0xF)

#endif