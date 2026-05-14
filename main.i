# 1 "src/main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 368 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "src/main.c" 2
# 1 "/Users/jaden/CEdev/include/stdint.h" 1 3



# 1 "/Users/jaden/CEdev/include/cdefs.h" 1 3
# 41 "/Users/jaden/CEdev/include/cdefs.h" 3
typedef unsigned int size_t;





typedef short wchar_t;
# 5 "/Users/jaden/CEdev/include/stdint.h" 2 3

typedef signed char int8_t;




typedef unsigned char uint8_t;



typedef signed char int_fast8_t;



typedef unsigned char uint_fast8_t;


typedef signed char int_least8_t;



typedef unsigned char uint_least8_t;



typedef short int16_t;




typedef unsigned short uint16_t;



typedef short int_fast16_t;



typedef unsigned short uint_fast16_t;


typedef short int_least16_t;



typedef unsigned short uint_least16_t;




typedef int int24_t;




typedef unsigned int uint24_t;





typedef long int int32_t;




typedef long unsigned int uint32_t;



typedef long int int_fast32_t;



typedef long unsigned int uint_fast32_t;


typedef long int int_least32_t;



typedef long unsigned int uint_least32_t;






typedef signed __int48 int48_t;






typedef unsigned __int48 uint48_t;





typedef long long int int64_t;




typedef long long unsigned int uint64_t;



typedef long long int int_fast64_t;



typedef long long unsigned int uint_fast64_t;


typedef long long int int_least64_t;



typedef long long unsigned int uint_least64_t;
# 144 "/Users/jaden/CEdev/include/stdint.h" 3
typedef long long int intmax_t;




typedef long long unsigned int uintmax_t;




typedef int intptr_t;



typedef unsigned int uintptr_t;
# 2 "src/main.c" 2
# 1 "/Users/jaden/CEdev/include/stdbool.h" 1 3
# 3 "src/main.c" 2

# 1 "src/attributes.h" 1
# 5 "src/main.c" 2
# 1 "src/types.h" 1






typedef enum {WHITE, BLACK} Color;
typedef enum {HASH, CAPTURES, QUIETS} Stage;

typedef uint8_t Square;
typedef uint8_t Piece;
typedef uint24_t Move;
typedef uint8_t Flags;

typedef Piece Board[128];

typedef struct {
  Piece piece;
  Square square;
} PieceInfo;
# 38 "src/types.h"
typedef struct {
  PieceInfo w_piece_list[16];
  PieceInfo b_piece_list[16];
  uint8_t w_count;
  uint8_t b_count;
} PieceList;
# 52 "src/types.h"
typedef struct {
  Board board;
  PieceList piece_list;

  Color side_to_move;

  Square en_passant_target;
  _Bool en_passant_legal;

  _Bool w_kingside_castle;
  _Bool w_queenside_castle;
  _Bool b_kingside_castle;
  _Bool b_queenside_castle;
} State;
# 6 "src/main.c" 2

# 1 "src/board.h" 1





extern State state;


void make_move(Move move);
void unmake_move(Move move);
void reset_board();
# 8 "src/main.c" 2


# 1 "src/movegen.h" 1
# 18 "src/movegen.h"
Move *generate_moves(Stage stage, Move *move_list);
# 11 "src/main.c" 2

Move move_pool[64 * 32];

int main(void) {

  Move *move_list;
  move_list = generate_moves(CAPTURES, move_pool);
  move_list = generate_moves(QUIETS, move_pool);

  return (int)move_list;
}
