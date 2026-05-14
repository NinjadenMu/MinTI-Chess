#ifndef TYPES_H
#define TYPES_H 1

#include <stdint.h>
#include <stdbool.h>

typedef enum {WHITE, BLACK} Color;
typedef enum {CAPTURES, MOVES} Stage;

typedef uint8_t Square;
typedef uint8_t Piece;
typedef uint24_t Move;
typedef uint8_t Flags;
typedef Piece Board[128];
typedef struct {
  Piece piece;
  Square square;
} PieceInfo;
typedef struct {
  PieceInfo w_piece_list[16];
  PieceInfo b_piece_list[16];
  uint8_t w_end;
  uint8_t b_end;
} PieceList;

typedef struct {
  Board board;
  PieceList piece_list;

  Color side_to_move;

  Square en_passant_target;
  bool en_passant_legal;

  bool w_kingside_castle;
  bool w_queenside_castle;
  bool b_kingside_castle;
  bool b_queenside_castle;
} State;

#define EMPTY 0
#define W_PAWN 1
#define B_PAWN 2
#define W_KNIGHT 3
#define B_KNIGHT 4
#define W_BISHOP 5
#define B_BISHOP 6
#define W_ROOK 7
#define B_ROOK 8
#define W_QUEEN 9
#define B_QUEEN 10
#define W_KING 11
#define B_KING 12

#endif