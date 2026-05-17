#ifndef CONSTS_H
#define CONSTS_H 1

#include <stdint.h>

#define MAX_PLY 32
#define SAFE_MOVES_PER_PLY 48

#define INLINE static inline __attribute__((always_inline))

#define N_OFFSET (-16)
#define NE_OFFSET (-15)
#define E_OFFSET (1)
#define SE_OFFSET (17)
#define S_OFFSET (16)
#define SW_OFFSET (15)
#define W_OFFSET (-1)
#define NW_OFFSET (-17)

extern const int8_t w_pawn_capture_offsets[2];
extern const int8_t b_pawn_capture_offsets[2];
extern const int8_t knight_offsets[8];
extern const int8_t bishop_offsets[4];
extern const int8_t rook_offsets[4];
extern const int8_t king_offsets[8];

#endif