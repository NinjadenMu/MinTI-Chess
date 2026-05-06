#ifndef UTILS_H
#define UTILS_H 1

#include "types.h"

#define IS_OFF_BOARD(square) ((square) & 0x88)

#define GET_COLOR(piece) (((piece) & 1) ? WHITE : BLACK)

/*
#define GET_FROM_SQUARE(move) (((move) >> 16) & 0xFF)
#define GET_TO_SQUARE(move) (((move) >> 8) & 0xFF)
#define GET_FLAGS(move) ((move) & 0xFF)

#define SET_FROM_SQUARE(move, square) ((move) | ((square) << 16))
#define SET_TO_SQUARE(move, square) ((move) | ((square) << 8))
#define SET_FLAGS(move, flags) ((move) | (flags))
*/
#endif