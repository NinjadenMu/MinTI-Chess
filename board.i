# 1 "src/board.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 368 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "src/board.c" 2
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
# 2 "src/board.c" 2
# 1 "/Users/jaden/CEdev/include/debug.h" 1 3







# 1 "/Users/jaden/CEdev/include/stdio.h" 1 3




# 1 "/Users/jaden/CEdev/include/stdarg.h" 1 3





typedef __builtin_va_list __gnuc_va_list;




typedef __builtin_va_list va_list;
# 6 "/Users/jaden/CEdev/include/stdio.h" 2 3




typedef struct
{
    unsigned char slot;
    unsigned char eof;
    unsigned char err;
} FILE;
# 40 "/Users/jaden/CEdev/include/stdio.h" 3
int inchar(void);

void outchar(char character);

void errchar(char character);

FILE *fopen(const char *__restrict filename, const char *__restrict mode);

FILE *freopen(const char *__restrict filename, const char *__restrict mode, FILE *__restrict stream);

int fclose(FILE *stream);

int fflush(FILE *stream);

int ferror(FILE *stream);

int feof(FILE *stream);

void clearerr(FILE *stream);

size_t fread(void *__restrict ptr, size_t size, size_t count, FILE *__restrict stream);

size_t fwrite(const void *__restrict ptr, size_t size, size_t count, FILE *__restrict stream);

long int ftell(FILE *stream) __attribute__((__warn_unused_result__));

int fseek(FILE *stream, long int offset, int origin);

void rewind(FILE *stream);

int fgetc(FILE *stream);

char *fgets(char *__restrict str, int num, FILE *__restrict stream);

int ungetc(int ch, FILE *stream);

int fputc(int c, FILE *stream);

int fputs(const char *__restrict str, FILE *__restrict stream);

int remove(const char *filename);

int rename(const char *old_filename, const char *new_filename);

int fileno(FILE *stream);



int getchar(void);

int putchar(int character);

int puts(const char *str);

int getc(FILE *stream);

int putc(int c, FILE *stream);

int printf(const char *__restrict format, ...)
    __attribute__((format(__printf__, 1, 2)));

int vprintf(const char *__restrict format, va_list va)
    __attribute__((format(__printf__, 1, 0)));

int sprintf(char *__restrict buffer, const char *__restrict format, ...)
    __attribute__((format(__printf__, 2, 3)));

int vsprintf(char *__restrict buffer, const char *__restrict format, va_list va)
    __attribute__((format(__printf__, 2, 0)));

int snprintf(char *__restrict buffer, size_t count, const char *__restrict format, ...)
    __attribute__((format(__printf__, 3, 4)));

int vsnprintf(char *__restrict buffer, size_t count, const char *__restrict format, va_list va)
    __attribute__((format(__printf__, 3, 0)));

int fprintf(FILE *__restrict stream, const char *__restrict format, ...)
    __attribute__((format(__printf__, 2, 3)));

int vfprintf(FILE *__restrict stream, const char *__restrict format, va_list va)
    __attribute__((format(__printf__, 2, 0)));

int asprintf(char **__restrict p_buffer, const char *__restrict format, ...)
    __attribute__((format(__printf__, 2, 3))) __attribute__((nonnull(1)));

int vasprintf(char **__restrict p_buffer, const char *__restrict format, va_list va)
    __attribute__((format(__printf__, 2, 0))) __attribute__((nonnull(1)));

int sscanf(const char *__restrict buffer, const char *__restrict format, ...)
    __attribute__((format(__scanf__, 2, 3)));

int vsscanf(const char *__restrict buffer, const char *__restrict format, va_list va)
    __attribute__((format(__scanf__, 2, 0)));

void perror(const char *str);
# 9 "/Users/jaden/CEdev/include/debug.h" 2 3
# 3 "src/board.c" 2
# 1 "/Users/jaden/CEdev/include/stdbool.h" 1 3
# 4 "src/board.c" 2

# 1 "src/types.h" 1






typedef enum {WHITE, BLACK} Color;
typedef enum {HASH, CAPTURES, QUIETS} Stage;

typedef uint8_t Square;

typedef uint8_t Piece;

typedef uint8_t PackedPiece;
typedef uint24_t Move;

typedef uint8_t Flags;

typedef PackedPiece Board[128];

typedef struct {
  Piece piece;
  Square square;
} PieceInfo;
# 42 "src/types.h"
typedef struct {
  PieceInfo w_piece_list[16];
  PieceInfo b_piece_list[16];
  uint8_t w_count;
  uint8_t b_count;
} PieceList;
# 56 "src/types.h"
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

typedef struct {
  PackedPiece captured_packed_piece;
  Square en_passant_target;
  _Bool en_passant_legal;

  _Bool w_kingside_castle;
  _Bool w_queenside_castle;
  _Bool b_kingside_castle;
  _Bool b_queenside_castle;
} UndoInfo;
# 6 "src/board.c" 2
# 1 "src/consts.h" 1
# 20 "src/consts.h"
extern const int8_t w_pawn_capture_offsets[2];
extern const int8_t b_pawn_capture_offsets[2];
extern const int8_t knight_offsets[8];
extern const int8_t bishop_offsets[4];
extern const int8_t rook_offsets[4];
extern const int8_t king_offsets[8];
# 7 "src/board.c" 2
# 1 "src/board.h" 1
# 18 "src/board.h"
extern State state;


_Bool make_move(Move move, UndoInfo *undo_info);
void unmake_move(Move move, UndoInfo *undo_info);
void reset_board(void);
# 8 "src/board.c" 2

State state;

static const State initial_state = {
  .board = {
    ((0) << 4 | 8), ((1) << 4 | 4), ((2) << 4 | 6), ((3) << 4 | 10),
    ((4) << 4 | 12), ((5) << 4 | 6), ((6) << 4 | 4), ((7) << 4 | 8),
    0, 0, 0, 0, 0, 0, 0, 0,

    ((8) << 4 | 2), ((9) << 4 | 2), ((10) << 4 | 2), ((11) << 4 | 2),
    ((12) << 4 | 2), ((13) << 4 | 2), ((14) << 4 | 2), ((15) << 4 | 2),
    0, 0, 0, 0, 0, 0, 0, 0,

    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,

    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,

    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,

    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,

    ((8) << 4 | 1), ((9) << 4 | 1), ((10) << 4 | 1), ((11) << 4 | 1),
    ((12) << 4 | 1), ((13) << 4 | 1), ((14) << 4 | 1), ((15) << 4 | 1),
    0, 0, 0, 0, 0, 0, 0, 0,

    ((0) << 4 | 7), ((1) << 4 | 3), ((2) << 4 | 5), ((3) << 4 | 9),
    ((4) << 4 | 11), ((5) << 4 | 5), ((6) << 4 | 3), ((7) << 4 | 7),
    0, 0, 0, 0, 0, 0, 0, 0
  },

  .piece_list = {
    .w_piece_list = {
      {7, 112}, {3, 113}, {5, 114}, {9, 115},
      {11, 116}, {5, 117}, {3, 118}, {7, 119},
      {1, 96}, {1, 97}, {1, 98}, {1, 99},
      {1, 100}, {1, 101}, {1, 102}, {1, 103}
    },
    .b_piece_list = {
      {8, 0}, {4, 1}, {6, 2}, {10, 3},
      {12, 4}, {6, 5}, {4, 6}, {8, 7},
      {2, 16}, {2, 17}, {2, 18}, {2, 19},
      {2, 20}, {2, 21}, {2, 22}, {2, 23}
    },
    .w_count = 16,
    .b_count = 16
  },

  .side_to_move = WHITE,

  .en_passant_target = 0,
  .en_passant_legal = 0,

  .w_kingside_castle = 1,
  .w_queenside_castle = 1,
  .b_kingside_castle = 1,
  .b_queenside_castle = 1
};

void reset_board() {
    state = initial_state;
}

_Bool square_is_attacked(Square square) {
  Piece enemy_pawn, enemy_knight, enemy_bishop, enemy_rook, enemy_queen, enemy_king;
  int8_t pawn_offset1, pawn_offset2;
  if ((state.side_to_move) == WHITE) {
    enemy_pawn = 2;
    enemy_knight = 4;
    enemy_bishop = 6;
    enemy_rook = 8;
    enemy_queen = 10;
    enemy_king = 12;

    pawn_offset1 = w_pawn_capture_offsets[0];
    pawn_offset2 = w_pawn_capture_offsets[1];
  }
  else {
    enemy_pawn = 1;
    enemy_knight = 3;
    enemy_bishop = 5;
    enemy_rook = 7;
    enemy_queen = 9;
    enemy_king = 11;

    pawn_offset1 = b_pawn_capture_offsets[0];
    pawn_offset2 = b_pawn_capture_offsets[1];
  }

  Square target;


  target = square + pawn_offset1;
  if (!((target) & 0x88) && (state.board[(target)] & 0xF) == enemy_pawn) return 1;

  target = square + pawn_offset2;
  if (!((target) & 0x88) && (state.board[(target)] & 0xF) == enemy_pawn) return 1;


#pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    target = square + knight_offsets[i];
    if (!((target) & 0x88) && (state.board[(target)] & 0xF) == enemy_knight) return 1;
  }


#pragma unroll
  for (uint8_t i = 0; i < 8; i++) {
    target = square + king_offsets[i];
    if (!((target) & 0x88) && (state.board[(target)] & 0xF) == enemy_king) return 1;
  }


#pragma unroll
  for (uint8_t i = 0; i < 4; i++) {
    int8_t offset = bishop_offsets[i];
    target = square + offset;

    while (!((target) & 0x88)) {
      Piece piece = (state.board[(target)] & 0xF);
      if (piece != 0) {
        if (piece == enemy_bishop || piece == enemy_queen) return 1;
        break;
      }
      target += offset;
    }
  }


#pragma unroll
  for (uint8_t i = 0; i < 4; i++) {
    int8_t offset = rook_offsets[i];
    target = square + rook_offsets[i];

    while (!((target) & 0x88)) {
      Piece piece = (state.board[(target)] & 0xF);
      if (piece != 0) {
        if (piece == enemy_rook || piece == enemy_queen) return 1;
        break;
      }
      target += offset;
    }
  }

  return 0;
}

_Bool make_move(Move move, UndoInfo *undo_info) {


  uint8_t *move_block = (uint8_t *)&move;

  Flags flags = move_block[0];
  Square to_square = move_block[1];
  Square from_square = move_block[2];

  PackedPiece from_packed_piece = (state.board[(from_square)]);

  Color from_color = (((from_piece) & 1) ? WHITE : BLACK);

  if (!flags) {
    (state.board[(to_square)] = (from_packed_piece));
    (state.board[(from_square)] = (0));

    PieceInfo *from_piece_list;
    if (from_color == WHITE) piece_list = (state.piece_list.w_piece_list);
    else piece_list = (state.piece_list.b_piece_list);

    from_piece_list[(((from_packed_piece) & 0xF0) >> 4);].square = to_square;
  }

  if (= (((flags) >> 1) & 0x1)) {
    undo_info->captured_packed_piece = to_packed_piece;

    PieceInfo *from_piece_list;
    PieceInfo *to_piece_list;
    if (from_color == WHITE) {
      from_piece_list = (state.piece_list.w_piece_list);

      to_piece_list = (state.piece_list.b_piece_list);
    }
    else piece_list {
      from_piece_list = (state.piece_list.b_piece_list);
      to_piece_list = (state.piece_list.w_piece_list);
    }

    from_piece_list[(((from_packed_piece) & 0xF0) >> 4)].piece = 0;
    to_piece_list[(((to_packed_piece) & 0xF0) >> 4)].piece = 0;


  }

  if ((((flags) >> 2) & 0x1)) {

  }

  return 1;
}
