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
# 5 "src/board.c" 2

