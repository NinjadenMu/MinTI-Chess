#include "compat.h"

uint8_t host_board[128];
uint8_t host_piece_list[2][16];
uint8_t host_piece_count[2];
uint8_t host_king_square[2];
uint8_t host_position_side;
uint8_t host_position_castling;
uint8_t host_position_ep_square;
uint8_t host_position_halfmove;
uint8_t host_piece_index[128];

uint24_t host_eval_score[2];
uint24_t host_eval_pawn_king_score[2][2];
uint24_t host_eval_nonpawn_material[2];
uint8_t host_eval_pawn_file_count[2][8];
uint8_t host_eval_bishop_count[2];
uint8_t host_eval_rook_file_count[2][8];

uint24_t host_hash_key[2];

uint8_t host_delta_attackers[HOST_DELTA_TABLE_SIZE];
int8_t host_delta_step[HOST_DELTA_TABLE_SIZE];

uint8_t host_pst_pawn_opening[HOST_PST_SIZE];
uint8_t host_pst_pawn_endgame[HOST_PST_SIZE];
uint8_t host_pst_knight[HOST_PST_SIZE];
uint8_t host_pst_bishop[HOST_PST_SIZE];
uint8_t host_pst_rook[HOST_PST_SIZE];
uint8_t host_pst_queen[HOST_PST_SIZE];
uint8_t host_pst_king_opening[HOST_PST_SIZE];
uint8_t host_pst_king_endgame[HOST_PST_SIZE];

uint32_t host_transposition_storage[
  HOST_TT_STORAGE_SIZE / sizeof(uint32_t)
];

uint8_t host_history[16][256];
