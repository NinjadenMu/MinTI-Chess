#ifndef MINTI_HOST_MEMORY_MAP_H
#define MINTI_HOST_MEMORY_MAP_H

#include <stdint.h>

// prevent memory map from ../ce/ from being used
#define MINTI_CE_MEMORY_MAP_H

enum {
  HOST_DELTA_TABLE_SIZE = 239,
  HOST_PST_SIZE = 128,

  HOST_TT_ENTRY_COUNT = 8192,

  HOST_TT_ENTRY_SIZE = 12,
  HOST_TT_STORAGE_SIZE =
    HOST_TT_ENTRY_COUNT * HOST_TT_ENTRY_SIZE,
};

extern uint8_t host_board[128];
extern uint8_t host_piece_list[2][16];
extern uint8_t host_piece_count[2];
extern uint8_t host_king_square[2];
extern uint8_t host_position_side;
extern uint8_t host_position_castling;
extern uint8_t host_position_ep_square;
extern uint8_t host_position_halfmove;
extern uint8_t host_piece_index[128];

extern uint24_t host_eval_score[2];
extern uint24_t host_eval_pawn_king_score[2][2];
extern uint24_t host_eval_nonpawn_material[2];
extern uint8_t host_eval_pawn_file_count[2][8];
extern uint8_t host_eval_bishop_count[2];
extern uint8_t host_eval_rook_file_count[2][8];

extern uint24_t host_hash_key[2];

extern uint8_t host_delta_attackers[HOST_DELTA_TABLE_SIZE];
extern int8_t host_delta_step[HOST_DELTA_TABLE_SIZE];

extern uint8_t host_pst_pawn_opening[HOST_PST_SIZE];
extern uint8_t host_pst_pawn_endgame[HOST_PST_SIZE];
extern uint8_t host_pst_knight[HOST_PST_SIZE];
extern uint8_t host_pst_bishop[HOST_PST_SIZE];
extern uint8_t host_pst_rook[HOST_PST_SIZE];
extern uint8_t host_pst_queen[HOST_PST_SIZE];
extern uint8_t host_pst_king_opening[HOST_PST_SIZE];
extern uint8_t host_pst_king_endgame[HOST_PST_SIZE];

// uint32_t ensures sufficient alignment 
extern uint32_t host_transposition_storage[
  HOST_TT_STORAGE_SIZE / sizeof(uint32_t)
];

extern uint8_t host_history[16][256];
#define CE_SIZE_HISTORY \
  (sizeof(host_history))

#define CE_ADDR_HASH_KEY \
  (host_hash_key)

#define CE_ADDR_TRANSPOSITION_TABLE \
  (host_transposition_storage)

#define CE_SIZE_TRANSPOSITION_TABLE \
  HOST_TT_STORAGE_SIZE

#define BOARD \
  (host_board)

#define PIECE_LIST \
  (host_piece_list)

#define PIECE_COUNT \
  (host_piece_count)

#define POSITION_KING_SQUARE \
  (host_king_square)

#define POSITION_SIDE \
  (host_position_side)

#define POSITION_CASTLING \
  (host_position_castling)

#define POSITION_EP_SQUARE \
  (host_position_ep_square)

#define POSITION_HALFMOVE \
  (host_position_halfmove)

#define PIECE_INDEX \
  (host_piece_index)

#define DELTA_ATTACKERS \
  (host_delta_attackers)

#define DELTA_STEP \
  (host_delta_step)

#define EVAL_SCORE \
  (host_eval_score)

#define EVAL_PAWN_KING_SCORE \
  (host_eval_pawn_king_score)

#define EVAL_NONPAWN_MATERIAL \
  (host_eval_nonpawn_material)

#define EVAL_PAWN_FILE_COUNT \
  (host_eval_pawn_file_count)

#define EVAL_BISHOP_COUNT \
  (host_eval_bishop_count)

#define EVAL_ROOK_FILE_COUNT \
  (host_eval_rook_file_count)

#define EVAL_PST_PAWN_OPENING \
  (host_pst_pawn_opening)

#define EVAL_PST_PAWN_ENDGAME \
  (host_pst_pawn_endgame)

#define EVAL_PST_KNIGHT \
  (host_pst_knight)

#define EVAL_PST_BISHOP \
  (host_pst_bishop)

#define EVAL_PST_ROOK \
  (host_pst_rook)

#define EVAL_PST_QUEEN \
  (host_pst_queen)

#define EVAL_PST_KING_OPENING \
  (host_pst_king_opening)

#define EVAL_PST_KING_ENDGAME \
  (host_pst_king_endgame)

#define HISTORY \
  (host_history)

#endif
