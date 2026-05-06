# 1 "src/movegen.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 368 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "src/movegen.c" 2
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
# 2 "src/movegen.c" 2
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
# 3 "src/movegen.c" 2

# 1 "src/types.h" 1




# 1 "/Users/jaden/CEdev/include/stdbool.h" 1 3
# 6 "src/types.h" 2

typedef enum {WHITE, BLACK} Color;

typedef uint8_t Square;
typedef uint8_t Piece;
typedef uint24_t Move;
typedef uint8_t Flags;

typedef Piece Board[128];
typedef Piece PieceList[2][16];

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
# 5 "src/movegen.c" 2
# 1 "src/utils.h" 1
# 6 "src/movegen.c" 2
# 1 "src/movegen.h" 1



# 1 "src/attributes.h" 1
# 5 "src/movegen.h" 2
# 18 "src/movegen.h"
extern Move move_pool[64 * 32];

extern Move *current_move_ptr;
# 7 "src/movegen.c" 2

State state;

Move move_pool[64 * 32];

static int8_t w_pawn_capture_offsets[2] = {(-15), (-17)};
static int8_t b_pawn_capture_offsets[2] = {(17), (15)};
static int8_t knight_offsets[8] = {-14, -18, -31, -33, 14, 18, 31, 33};
static int8_t king_offsets[8] = {(-16), (-15), (1), (17),
                                 (16), (15), (-1), (-17)};

static inline __attribute__((always_inline)) Move *add_move(Square from_square, Square to_square, Flags flags, Move *move_list) {
  uint8_t *move_block = (uint8_t *)move_list;



  move_block[0] = flags;
  move_block[1] = to_square;
  move_block[2] = from_square;

  return move_list + 1;
}

static inline __attribute__((always_inline)) Move *generate_stepping_captures(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!((target) & 0x88)) {
    Piece target_piece = state->board[target];
    if (target_piece != 0) {
      if ((((target_piece) & 1) ? WHITE : BLACK) != state->side_to_move) {
        move_list = add_move(square, target, 0, move_list);
      }
    }
  }

  return move_list;
}

static inline __attribute__((always_inline)) Move *generate_sliding_captures(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  Piece *board = state->board;
  while (!((target) & 0x88)) {
    Piece target_piece = board[target];
    if (target_piece == 0) {
      target += offset;
      continue;
    }

    else {
      if ((((target_piece) & 1) ? WHITE : BLACK) != state->side_to_move) {
        move_list = add_move(square, target, 0, move_list);
      }

      break;
    }
  }

  return move_list;
}

static Move *generate_pawn_captures(State *state, Square square, Move *move_list) {
  Color my_color = state->side_to_move;
  Square target;
  for (int i = 0; i < 2; i++) {
    if (my_color == WHITE) target = square + w_pawn_capture_offsets[i];
    else target = square + b_pawn_capture_offsets[i];

    if (!((target) & 0x88)) {
      if (target == state->en_passant_target && state->en_passant_legal) {
        move_list = add_move(square, target, ((0) << 4 | (1) << 3), move_list);
      }

      else {
        Piece target_piece = state->board[target];
        if (target_piece != 0) {
          if ((((target_piece) & 1) ? WHITE : BLACK) != state->side_to_move) {
            if (target < 16) {
              move_list = add_move(square, target, ((9) << 4 | (0) << 3), move_list);
              move_list = add_move(square, target, ((7) << 4 | (0) << 3), move_list);
              move_list = add_move(square, target, ((5) << 4 | (0) << 3), move_list);
              move_list = add_move(square, target, ((3) << 4 | (0) << 3), move_list);
            }

            else if (target >= 112) {
              move_list = add_move(square, target, ((10) << 4 | (0) << 3), move_list);
              move_list = add_move(square, target, ((8) << 4 | (0) << 3), move_list);
              move_list = add_move(square, target, ((6) << 4 | (0) << 3), move_list);
              move_list = add_move(square, target, ((4) << 4 | (0) << 3), move_list);
            }

            else {
              move_list = add_move(square, target, 0, move_list);
            }
          }
        }
      }
    }
  }

  return move_list;
}

static Move *generate_knight_captures(State *state, Square square, Move *move_list) {
  const int8_t *offset_ptr = knight_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures(state, square, *offset_ptr++, move_list);
  }

  return move_list;
}

static Move *generate_bishop_captures(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_captures(state, square, (-15), move_list);
  move_list = generate_sliding_captures(state, square, (17), move_list);
  move_list = generate_sliding_captures(state, square, (15), move_list);
  move_list = generate_sliding_captures(state, square, (-17), move_list);

  return move_list;
}

static Move *generate_rook_captures(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_captures(state, square, (-16), move_list);
  move_list = generate_sliding_captures(state, square, (1), move_list);
  move_list = generate_sliding_captures(state, square, (16), move_list);
  move_list = generate_sliding_captures(state, square, (-1), move_list);

  return move_list;
}

static Move *generate_queen_captures(State *state, Square square, Move *move_list) {
  move_list = generate_bishop_captures(state, square, move_list);
  move_list = generate_rook_captures(state, square, move_list);

  return move_list;
}

static Move *generate_king_captures(State *state, Square square, Move *move_list) {
  const int8_t *offset_ptr = king_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_captures(state, square, *offset_ptr++, move_list);
  }

  return move_list;
}

static inline __attribute__((always_inline)) Move *generate_stepping_moves(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  if (!((target) & 0x88)) {
    Piece target_piece = state->board[target];
    if (target_piece == 0) {
      move_list = add_move(square, target, 0, move_list);
    }
  }

  return move_list;
}

static inline __attribute__((always_inline)) Move *generate_sliding_moves(State *state, Square square, int8_t offset, Move *move_list) {
  Square target = square + offset;
  Piece *board = state->board;
  while (!((target) & 0x88)) {
    Piece target_piece = board[target];
    if (target_piece == 0) {
      move_list = add_move(square, target, 0, move_list);
      target += offset;
    }

    else {
      break;
    }
  }

  return move_list;
}

static Move *generate_pawn_moves(State *state, Square square, Move *move_list) {
  if (state->side_to_move == WHITE) {
    Square target = square + (-16);
    if (state->board[target] == 0) {

      if (target >= 16) {
        move_list = add_move(square, target, 0, move_list);


        if (96 <= square && square < 112) {
          if (state->board[target + (-16)] == 0)
            move_list = add_move(square, target + (-16), 0, move_list);
        }
      }


      else {
        move_list = add_move(square, target, ((9) << 4 | (0) << 3), move_list);
        move_list = add_move(square, target, ((7) << 4 | (0) << 3), move_list);
        move_list = add_move(square, target, ((5) << 4 | (0) << 3), move_list);
        move_list = add_move(square, target, ((3) << 4 | (0) << 3), move_list);
      }
    }
  }

  else {
    Square target = square + (16);
    if (state->board[target] == 0) {

      if (target < 112) {
        move_list = add_move(square, target, 0, move_list);


        if (16 <= square && square < 32) {
          if (state->board[target + (16)] == 0)
            move_list = add_move(square, target + (16), 0, move_list);
        }
      }


      else {
        move_list = add_move(square, target, ((10) << 4 | (0) << 3), move_list);
        move_list = add_move(square, target, ((8) << 4 | (0) << 3), move_list);
        move_list = add_move(square, target, ((6) << 4 | (0) << 3), move_list);
        move_list = add_move(square, target, ((4) << 4 | (0) << 3), move_list);
      }
    }
  }

  return move_list;
}

static Move *generate_knight_moves(State *state, Square square, Move *move_list) {
  const int8_t *offset_ptr = knight_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_moves(state, square, *offset_ptr++, move_list);
  }

  return move_list;
}

static Move *generate_bishop_moves(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_moves(state, square, (-15), move_list);
  move_list = generate_sliding_moves(state, square, (17), move_list);
  move_list = generate_sliding_moves(state, square, (15), move_list);
  move_list = generate_sliding_moves(state, square, (-17), move_list);

  return move_list;
}

static Move *generate_rook_moves(State *state, Square square, Move *move_list) {
  move_list = generate_sliding_moves(state, square, (-16), move_list);
  move_list = generate_sliding_moves(state, square, (1), move_list);
  move_list = generate_sliding_moves(state, square, (16), move_list);
  move_list = generate_sliding_moves(state, square, (-1), move_list);

  return move_list;
}

static Move *generate_queen_moves(State *state, Square square, Move *move_list) {
  move_list = generate_bishop_moves(state, square, move_list);
  move_list = generate_rook_moves(state, square, move_list);

  return move_list;
}

static Move *generate_king_moves(State *state, Square square, Move *move_list) {
  Color my_color = state->side_to_move;

  const int8_t *offset_ptr = king_offsets;
  for (uint8_t i = 0; i < 8; i++) {
    move_list = generate_stepping_moves(state, square, *offset_ptr++, move_list);
  }

  if (my_color == WHITE) {
    if (state->w_kingside_castle) {
      if (state->board[square + (1)] == 0 &&
          state->board[square + (1) + (1)] == 0) {
          move_list = add_move(square, square + (1) + (1), 0, move_list);
        }
    }

    if (state->w_queenside_castle) {
      if (state->board[square + (-1)] == 0 &&
          state->board[square + (-1) + (-1)] == 0 &&
          state->board[square + (-1) + (-1) + (-1)] == 0) {
          move_list = add_move(square, square + (-1) + (-1), 0, move_list);
        }
    }
  }

  else {
    if (state->b_kingside_castle) {
      if (state->board[square + (1)] == 0 &&
          state->board[square + (1) + (1)] == 0) {
          move_list = add_move(square, square + (1) + (1), 0, move_list);
        }
    }

    if (state->b_queenside_castle) {
      if (state->board[square + (-1)] == 0 &&
          state->board[square + (-1) + (-1)] == 0 &&
          state->board[square + (-1) + (-1) + (-1)] == 0) {
          move_list = add_move(square, square + (-1) + (-1), 0, move_list);
        }
    }
  }

  return move_list;
}

int main(void) {
  Move *move_list = move_pool;

  move_list = generate_pawn_captures(&state, 0, move_list);
  move_list = generate_knight_captures(&state, 0, move_list);
  move_list = generate_bishop_captures(&state, 0, move_list);
  move_list = generate_rook_captures(&state, 0, move_list);
  move_list = generate_queen_captures(&state, 0, move_list);
  move_list = generate_king_captures(&state, 0, move_list);


  return 0;
}
