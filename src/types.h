#ifndef TYPES_H
#define TYPES_H 1

#include <stdint.h>
#include <stdbool.h>

typedef enum {WHITE, BLACK} Color;
typedef enum {HASH, CAPTURES, QUIETS} Stage;

typedef uint8_t Square;
// ranges from 0 to 12 (fits in lower 4 bits)
typedef uint8_t Piece;
// the upper 4 bits of PackedPiece are its index in its piece list
typedef uint8_t PackedPiece;
typedef uint24_t Move;
// a flag with value 0 indicates a "normal" move (no promotion/castling)
typedef uint8_t Flags;

typedef PackedPiece Board[128];

typedef struct {
  Piece piece;
  Square square;
} PieceInfo;

/**
 * @brief Compact lists of all white and black pieces on board
 * 
 * This allows for iteration over all pieces of a specific color without
 * needing to scan the entire Board array (which may contain many EMPTY's)
 * It also guarantees that the king's position in the piece list is fixed
 * at index 0
 * 
 * @invariant The arrays begin with the king and remain "densely" packed
 * Specifically:
 * - `w_piece_list[0]` must correspond to the white king
 * - `b_piece_list[0]` must correspond to the black king
 * - `w_piece_list[0]` through `w_piece_list[w_count - 1]` must contain valid,
 *    non-EMPTY pieces.
 * - `w_piece_list[w_count]` through `w_piece_list[15]` must have their piece
 *    type set to `EMPTY`.
 * - `b_piece_list[0]` through `b_piece_list[b_count - 1]` must contain valid,
 *    non-EMPTY pieces.
 * - `b_piece_list[b_count]` through `b_piece_list[15]` must have their piece
 *    type set to `EMPTY`.
 */
typedef struct {
  PieceInfo w_piece_list[16];
  PieceInfo b_piece_list[16];
  uint8_t w_count;
  uint8_t b_count;
} PieceList;

/**
 * @brief Represents complete state of a chess game
 * 
 * This structure also contains all data structures (including the board
 * and piece lists) required to define, evaluate, and generate moves for a
 * position
 */
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

typedef struct {
  PackedPiece captured_packed_piece;
  Square en_passant_target;
  bool en_passant_legal;

  bool w_kingside_castle;
  bool w_queenside_castle;
  bool b_kingside_castle;
  bool b_queenside_castle;
} UndoInfo;

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