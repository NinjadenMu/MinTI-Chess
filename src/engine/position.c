/**
 * @file position.c
 * 
 * Implementation of position.h, implements basic utilities for reading and  
 * setting state
 */

#include <stdint.h>
#include <string.h>

#include "../ce/memory_map.h"
#include "../config.h"
#include "evaluation.h"
#include "position.h"
#include "types.h"

void position_clear(void)
{
  memset(BOARD, PIECE_EMPTY, 128);
  memset(PIECE_LIST, SQUARE_NONE, 32);
  memset(PIECE_INDEX, PIECE_INDEX_NONE, 128);

  PIECE_COUNT[0] = 0;
  PIECE_COUNT[1] = 0;

  POSITION_KING_SQUARE[0] = SQUARE_NONE;
  POSITION_KING_SQUARE[1] = SQUARE_NONE;

  POSITION_SIDE = COLOR_WHITE;
  POSITION_CASTLING = 0;
  POSITION_EP_SQUARE = SQUARE_NONE;
  POSITION_HALFMOVE = 0;

  evaluation_clear();
}

uint8_t position_add_piece(uint8_t square, uint8_t piece)
{
  if (SQUARE_OFFBOARD(square)) {
    return 1;
  }
  if (!piece_code_is_valid(piece)) {
    return 1;
  }
  if (BOARD[square] != PIECE_EMPTY) {
    return 1;
  }

  uint8_t color_index = COLOR_INDEX(PIECE_COLOR(piece));
  uint8_t list_index = PIECE_COUNT[color_index];

  if (list_index >= 16) {
    return 1;
  }
  // don't add a second king of the same color
  if (
    PIECE_TYPE(piece) == PIECE_KING &&
    POSITION_KING_SQUARE[color_index] != SQUARE_NONE
  ) {
    return 1;
  }

  BOARD[square] = piece;
  PIECE_LIST[color_index][list_index] = square;
  PIECE_INDEX[square] = list_index;
  PIECE_COUNT[color_index] = list_index + 1;

  if (PIECE_TYPE(piece) == PIECE_KING) {
    POSITION_KING_SQUARE[color_index] = square;
  }

  evaluation_add_piece(piece, square);

  return 0;
}

uint8_t position_remove_piece(uint8_t square)
{
  if (SQUARE_OFFBOARD(square)) {
    return PIECE_EMPTY;
  }

  uint8_t piece = BOARD[square];
  if (piece == PIECE_EMPTY) {
    return PIECE_EMPTY;
  }

  evaluation_remove_piece(piece, square);

  uint8_t color_index = COLOR_INDEX(PIECE_COLOR(piece));
  uint8_t list_index = PIECE_INDEX[square];
  uint8_t last_index = PIECE_COUNT[color_index] - 1;
  uint8_t last_square = PIECE_LIST[color_index][last_index];

  PIECE_LIST[color_index][list_index] = last_square;
  PIECE_INDEX[last_square] = list_index;
  PIECE_COUNT[color_index] = last_index;

  BOARD[square] = PIECE_EMPTY;
  PIECE_INDEX[square] = PIECE_INDEX_NONE;

  if (PIECE_TYPE(piece) == PIECE_KING) {
    POSITION_KING_SQUARE[color_index] = SQUARE_NONE;
  }

  return piece;
}

uint8_t position_move_piece(uint8_t from, uint8_t to)
{
  if (SQUARE_OFFBOARD(from) || SQUARE_OFFBOARD(to)) {
    return 1;
  }

  uint8_t piece = BOARD[from];

  if (piece == PIECE_EMPTY || BOARD[to] != PIECE_EMPTY) {
    return 1;
  }

  evaluation_move_piece(piece, from, to);
  
  uint8_t color_index = COLOR_INDEX(PIECE_COLOR(piece));
  uint8_t list_index = PIECE_INDEX[from];

  BOARD[from] = PIECE_EMPTY;
  BOARD[to] = piece;

  PIECE_LIST[color_index][list_index] = to;
  PIECE_INDEX[to] = list_index;
  PIECE_INDEX[from] = PIECE_INDEX_NONE;

  if (PIECE_TYPE(piece) == PIECE_KING) {
    POSITION_KING_SQUARE[color_index] = to;
  }

  return 0;
}

uint8_t position_set_start(void)
{
  static const uint8_t back_rank[8] = {
    PIECE_ROOK,
    PIECE_KNIGHT,
    PIECE_BISHOP,
    PIECE_QUEEN,
    PIECE_KING,
    PIECE_BISHOP,
    PIECE_KNIGHT,
    PIECE_ROOK
  };
  position_clear();

  for (uint8_t file = 0; file < 8; ++file) {
    if (position_add_piece(
      SQUARE(file, 0),
      COLOR_WHITE | back_rank[file]
    )) {
      return 1;
    }
  }

  for (uint8_t file = 0; file < 8; ++file) {
    if (position_add_piece(SQUARE(file, 1), WHITE_PAWN)) {
      return 1;
    }
  }

  for (uint8_t file = 0; file < 8; ++file) {
    if (position_add_piece(
      SQUARE(file, 7),
      COLOR_BLACK | back_rank[file]
    )) {
      return 1;
    }
  }

  for (uint8_t file = 0; file < 8; ++file) {
    if (position_add_piece(SQUARE(file, 6), BLACK_PAWN)) {
      return 1;
    }
  }

  POSITION_SIDE = COLOR_WHITE;
  POSITION_CASTLING = CASTLE_ALL;
  POSITION_EP_SQUARE = SQUARE_NONE;
  POSITION_HALFMOVE = 0;

  return 0;
}

static uint8_t fen_piece_code(char character)
{
  uint8_t color;
  if (character >= 'A' && character <= 'Z') {
    color = COLOR_WHITE;
  }
  else if (character >= 'a' && character <= 'z') {
    color = COLOR_BLACK;
    character = (char)(character - 'a' + 'A');
  }
  else {
    return PIECE_EMPTY;
  }

  uint8_t type;
  switch (character) {
    case 'P': type = PIECE_PAWN;   break;
    case 'N': type = PIECE_KNIGHT; break;
    case 'B': type = PIECE_BISHOP; break;
    case 'R': type = PIECE_ROOK;   break;
    case 'Q': type = PIECE_QUEEN;  break;
    case 'K': type = PIECE_KING;   break;
    default: return PIECE_EMPTY;
 }

  return color | type;
}

uint8_t position_from_fen(const char *fen)
{
  const char *cursor = fen;
  uint8_t rank = 7;
  uint8_t file = 0;
  char character;

  if (fen == NULL) {
    return 1;
  }

  position_clear();

  while (1) {
    uint8_t piece;

    character = *cursor++;

    if (character == '\0') {
      goto fail;
    }

    if (character == ' ') {
      break;
    }

    if (character == '/') {
      if (file != 8 || rank == 0) {
        goto fail;
      }

      --rank;
      file = 0;
      continue;
    }

    if (character >= '1' && character <= '8') {
      file += character - '0';

      if (file > 8) {
        goto fail;
      }

      continue;
    }

    if (file >= 8) {
      goto fail;
    }

    piece = fen_piece_code(character);

    if (
      piece == PIECE_EMPTY ||
      position_add_piece(SQUARE(file, rank), piece)
    ) {
      goto fail;
    }

    ++file;
  }

  if (rank != 0 || file != 8) {
    goto fail;
  }

  if (*cursor == 'w') {
    POSITION_SIDE = COLOR_WHITE;
  }
  else if (*cursor == 'b') {
    POSITION_SIDE = COLOR_BLACK;
  }
  else {
    goto fail;
  }

  ++cursor;

  if (*cursor++ != ' ') {
    goto fail;
  }

  POSITION_CASTLING = 0;

  if (*cursor == '-') {
    ++cursor;
  }
  else {
    while (*cursor != ' ' && *cursor != '\0') {
      switch (*cursor++) {
        case 'K':
          POSITION_CASTLING |= CASTLE_WHITE_KING;
          break;

        case 'Q':
          POSITION_CASTLING |= CASTLE_WHITE_QUEEN;
          break;

        case 'k':
          POSITION_CASTLING |= CASTLE_BLACK_KING;
          break;

        case 'q':
          POSITION_CASTLING |= CASTLE_BLACK_QUEEN;
          break;

        default:
          goto fail;
      }
    }
  }

  if (*cursor++ != ' ') {
    goto fail;
  }

  if (*cursor == '-') {
    POSITION_EP_SQUARE = SQUARE_NONE;
    ++cursor;
  }
  else {
    uint8_t ep_file;
    uint8_t ep_rank;

    if (
      cursor[0] < 'a' || cursor[0] > 'h' ||
      (cursor[1] != '3' && cursor[1] != '6')
    ) {
      goto fail;
    }

    ep_file = cursor[0] - 'a';
    ep_rank = cursor[1] - '1';
    POSITION_EP_SQUARE = SQUARE(ep_file, ep_rank);
    cursor += 2;
  }

  POSITION_HALFMOVE = 0;

  if (*cursor == ' ') {
    uint8_t value = 0;

    ++cursor;

    if (*cursor < '0' || *cursor > '9') {
      goto fail;
    }

    while (*cursor >= '0' && *cursor <= '9') {
      // clever little trick for multiplying by 10
      value = (value << 3) + (value << 1);
      value += *cursor - '0';

      ++cursor;
    }

    POSITION_HALFMOVE = value;
  }
  else if (*cursor != '\0') {
    goto fail;
  }

  if (!position_is_consistent()) {
    goto fail;
  }

  return 0;

fail:
  position_clear();
  return 1;
}

uint8_t position_is_consistent(void)
{
  uint8_t board_count[2] = { 0, 0 };
  uint8_t found_king[2] = { SQUARE_NONE, SQUARE_NONE };

  for (uint8_t color_index = 0; color_index < 2; ++color_index) {
    uint8_t count = PIECE_COUNT[color_index];

    if (count > 16) {
      return 0;
    }

    for (uint8_t index = 0; index < count; ++index) {
      uint8_t square = PIECE_LIST[color_index][index];

      if (SQUARE_OFFBOARD(square)) {
        return 0;
      }

      uint8_t piece = BOARD[square];

      if (
        piece == PIECE_EMPTY ||
        COLOR_INDEX(PIECE_COLOR(piece)) != color_index ||
        PIECE_INDEX[square] != index
      ) {
        return 0;
      }
    }
  }

  for (uint8_t rank = 0; rank < 8; ++rank) {
    for (uint8_t file = 0; file < 8; ++file) {
      uint8_t square = SQUARE(file, rank);
      uint8_t piece = BOARD[square];

      if (piece == PIECE_EMPTY) {
        if (PIECE_INDEX[square] != PIECE_INDEX_NONE) {
          return 0;
        }

        continue;
      }

      if (!piece_code_is_valid(piece)) {
        return 0;
      }

      uint8_t color_index = COLOR_INDEX(PIECE_COLOR(piece));

      if (
        PIECE_INDEX[square] >= PIECE_COUNT[color_index] ||
        PIECE_LIST[color_index][PIECE_INDEX[square]] != square
      ) {
        return 0;
      }

      ++board_count[color_index];

      if (PIECE_TYPE(piece) == PIECE_KING) {
        if (found_king[color_index] != SQUARE_NONE) {
          return 0;
        }

        found_king[color_index] = square;
      }
    }
  }

  if (
    board_count[0] != PIECE_COUNT[0] ||
    board_count[1] != PIECE_COUNT[1]
  ) {
    return 0;
  }

  if (
    found_king[0] == SQUARE_NONE ||
    found_king[1] == SQUARE_NONE ||
    found_king[0] != POSITION_KING_SQUARE[0] ||
    found_king[1] != POSITION_KING_SQUARE[1]
  ) {
    return 0;
  }

  if (
    POSITION_SIDE != COLOR_WHITE &&
    POSITION_SIDE != COLOR_BLACK
  ) {
    return 0;
  }

  return 1;
}
