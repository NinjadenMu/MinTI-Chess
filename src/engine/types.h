/**
 * @file types.h
 * 
 * Defines shared constants and types for engine
 */

#ifndef MINTI_ENGINE_TYPES_H
#define MINTI_ENGINE_TYPES_H

#include <stdint.h>

/*
 * Piece encoding:
 * Bits 0 to 2 represent type, bit 3 represents color
 */

enum {
  PIECE_EMPTY  = 0,
  PIECE_PAWN   = 1,
  PIECE_KNIGHT = 2,
  PIECE_KING   = 3,
  PIECE_BISHOP = 4,
  PIECE_ROOK   = 5,
  PIECE_QUEEN  = 6
};

enum {
  COLOR_WHITE = 0x00,
  COLOR_BLACK = 0x08
};

#define WHITE_PAWN   (COLOR_WHITE | PIECE_PAWN)
#define WHITE_KNIGHT (COLOR_WHITE | PIECE_KNIGHT)
#define WHITE_KING   (COLOR_WHITE | PIECE_KING)
#define WHITE_BISHOP (COLOR_WHITE | PIECE_BISHOP)
#define WHITE_ROOK   (COLOR_WHITE | PIECE_ROOK)
#define WHITE_QUEEN  (COLOR_WHITE | PIECE_QUEEN)

#define BLACK_PAWN   (COLOR_BLACK | PIECE_PAWN)
#define BLACK_KNIGHT (COLOR_BLACK | PIECE_KNIGHT)
#define BLACK_KING   (COLOR_BLACK | PIECE_KING)
#define BLACK_BISHOP (COLOR_BLACK | PIECE_BISHOP)
#define BLACK_ROOK   (COLOR_BLACK | PIECE_ROOK)
#define BLACK_QUEEN  (COLOR_BLACK | PIECE_QUEEN)

#define PIECE_TYPE(piece)   ((uint8_t)((piece) & 0x07))
#define PIECE_COLOR(piece)  ((uint8_t)((piece) & COLOR_BLACK))
#define COLOR_INDEX(color)  ((uint8_t)((color) >> 3))
#define OPPOSITE_COLOR(c)   ((uint8_t)((c) ^ COLOR_BLACK))

/*
 * Squares are encoded for a 0x88 board, where rank 0 corresponds to rank 1 
 * on a chess board, and file 0 corresponds to file a on a chess board.
 * 
 * Bits 4 through 6 encode rank, bits 0 through 2 encode file.  
 * Bits 3 and 7 are only set for off-board (overflow) squares.
 *
 * `rank` zero is rank 1 on the board. `file` zero is file a on the board.
 */
#define SQUARE(file, rank) \
  ((uint8_t)((((uint8_t)(rank)) << 4) | ((uint8_t)(file))))

#define SQUARE_FILE(square) ((uint8_t)((square) & 0x07))
#define SQUARE_RANK(square) ((uint8_t)((square) >> 4))
// Mirros square vertically, allows both colors to use one piece square table
#define SQUARE_FLIP(square) ((uint8_t)((square) ^ 0x70))
#define SQUARE_OFFBOARD(square) ((uint8_t)((square) & 0x88))

#define SQUARE_NONE ((uint8_t)0xFF)
#define PIECE_INDEX_NONE ((uint8_t)0xFF)

// Castling-right flags
enum {
  CASTLE_WHITE_KING  = 0x01,
  CASTLE_WHITE_QUEEN = 0x02,
  CASTLE_BLACK_KING  = 0x04,
  CASTLE_BLACK_QUEEN = 0x08,
  CASTLE_ALL         = 0x0F
};

/*
 * Move representation
 *
 * Note that this isn't the most compact possible representation, since 
 * making move_t a power-of-two size allows for accessing elements with 
 * i << 2.
 */
typedef struct {
  uint8_t from;
  uint8_t to;
  uint8_t flags;
  uint8_t score;
} move_t;

// Move flags
enum {
  MF_QUIET   = 0x00,
  MF_CAPTURE = 0x01,
  MF_EP      = 0x02,
  MF_CASTLE  = 0x04,
  // Double pawn push
  MF_DPUSH   = 0x08,
  MF_PROMO   = 0x10,

  MF_PROMO_QUEEN  = 0x00,
  MF_PROMO_ROOK   = 0x20,
  MF_PROMO_BISHOP = 0x40,
  MF_PROMO_KNIGHT = 0x60,

  MF_PROMO_TYPE_MASK = 0x60
};

/*
 * Generation stages
 *
 * GEN_CAPTURES also includes all promotions
 */
enum {
  GEN_CAPTURES = 0x01,
  GEN_QUIETS   = 0x02,
  GEN_ALL      = GEN_CAPTURES | GEN_QUIETS
};

// Attack masks used by DELTA_ATTACKERS
enum {
  ATK_WPAWN  = 0x01,
  ATK_BPAWN  = 0x02,
  ATK_KNIGHT = 0x04,
  ATK_KING   = 0x08,
  ATK_DIAG   = 0x10,
  ATK_ORTH   = 0x20
};

// Index delta tables with target_square - attacker_square + DELTA_TABLE_OFFSET
#define DELTA_TABLE_OFFSET 119
#define DELTA_TABLE_SIZE   239
#define DELTA_TABLE_INDEX(delta) \
  ((uint8_t)((delta) + DELTA_TABLE_OFFSET))

static inline uint8_t piece_code_is_valid(uint8_t piece) {
  uint8_t type = PIECE_TYPE(piece);
  return
    !(piece & 0xf0) &&
    type >= PIECE_PAWN &&
    type <= PIECE_QUEEN;
}

static inline uint8_t piece_is_friendly(uint8_t piece, uint8_t side)
{
  return
    piece != PIECE_EMPTY &&
    PIECE_COLOR(piece) == side;
}

static inline uint8_t piece_is_enemy(uint8_t piece, uint8_t side)
{
  return
    piece != PIECE_EMPTY &&
    PIECE_COLOR(piece) != side;
}

/*
 * Return value for if move buffer overflows, distinguishable from number 
 * of moves generated since the upper bound of pseudolegal moves in reachable 
 * positions is ~225 (exact number not known though)
 */
#define MOVEGEN_OVERFLOW 0xff

#endif
