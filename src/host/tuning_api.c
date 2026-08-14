#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#include "../ce/memory_map.h"
#include "../config.h"
#include "../engine/engine.h"
#include "../engine/evaluation.h"
#include "../engine/evaluation_constants.h"
#include "../engine/make_move.h"
#include "../engine/position.h"
#include "../engine/repetition.h"
#include "../engine/search.h"
#include "../engine/types.h"
#include "tuning_api.h"

enum {
  SELFPLAY_DEPTH = 4
};

static uint8_t initialized;

static int ensure_initialized(void)
{
  if (initialized) {
    return MINTI_HOST_OK;
  }

  if (engine_init() != 0) {
    return MINTI_HOST_INITIALIZATION_FAILED;
  }

  initialized = 1;
  return MINTI_HOST_OK;
}

int minti_host_init(void)
{
  return ensure_initialized();
}

size_t minti_host_tunable_count(void)
{
  return EVAL_TUNABLE_COUNT;
}

int minti_host_get_tunables(double *parameters)
{
  if (parameters == NULL) {
    return MINTI_HOST_INVALID_ARGUMENT;
  }

  int status = ensure_initialized();
  if (status != MINTI_HOST_OK) {
    return status;
  }

  evaluation_host_get_tunables(parameters);
  return MINTI_HOST_OK;
}

int minti_host_set_tunables(const double *parameters)
{
  if (parameters == NULL) {
    return MINTI_HOST_INVALID_ARGUMENT;
  }

  int status = ensure_initialized();
  if (status != MINTI_HOST_OK) {
    return status;
  }

  evaluation_host_stage_tunables(parameters);
  evaluation_init();

  return MINTI_HOST_OK;
}

int minti_host_score_fens(
  const char *const *fens,
  size_t count,
  int32_t *scores,
  size_t *failed_index
)
{
  if (
    (count != 0 && fens == NULL) ||
    (count != 0 && scores == NULL)
  ) {
    return MINTI_HOST_INVALID_ARGUMENT;
  }

  int status = ensure_initialized();
  if (status != MINTI_HOST_OK) {
    return status;
  }

  for (size_t index = 0; index < count; ++index) {
    if (
      fens[index] == NULL ||
      position_from_fen(fens[index]) != 0
    ) {
      if (failed_index != NULL) {
        *failed_index = index;
      }

      return MINTI_HOST_INVALID_FEN;
    }

    repetition_game_reset();

    uint8_t side = POSITION_SIDE;
    eval_t score;

    if (search_quiescence_position(&score) != 0) {
      if (failed_index != NULL) {
        *failed_index = index;
      }

      return MINTI_HOST_SEARCH_FAILED;
    }

    scores[index] =
      side == COLOR_WHITE
        ? score
        : -score;
  }

  return MINTI_HOST_OK;
}

static char fen_piece(uint8_t piece)
{
  static const char names[7] = {
    '\0', 'P', 'N', 'K', 'B', 'R', 'Q'
  };

  char result = names[PIECE_TYPE(piece)];

  if (PIECE_COLOR(piece) == COLOR_BLACK) {
    result = (char)(result - 'A' + 'a');
  }

  return result;
}

static uint8_t append_character(
  char **cursor,
  char *end,
  char character
)
{
  if (*cursor + 1 >= end) {
    return 1;
  }

  *(*cursor)++ = character;
  **cursor = '\0';

  return 0;
}

static uint8_t position_to_fen(
  char *output,
  size_t capacity
)
{
  if (capacity == 0) {
    return 1;
  }

  char *cursor = output;
  char *end = output + capacity;
  *cursor = '\0';

#define APPEND(character_)                                                     \
  do {                                                                         \
    if (append_character(&cursor, end, character_)) {                          \
      return 1;                                                                \
    }                                                                          \
  } while (0)

  for (int rank = 7; rank >= 0; --rank) {
    uint8_t empty = 0;

    for (uint8_t file = 0; file < 8; ++file) {
      uint8_t piece = BOARD[SQUARE(file, rank)];

      if (piece == PIECE_EMPTY) {
        ++empty;
        continue;
      }

      if (empty != 0) {
        APPEND((char)('0' + empty));
        empty = 0;
      }

      APPEND(fen_piece(piece));
    }

    if (empty != 0) {
      APPEND((char)('0' + empty));
    }

    if (rank != 0) {
      APPEND('/');
    }
  }

  APPEND(' ');
  APPEND(POSITION_SIDE == COLOR_WHITE ? 'w' : 'b');
  APPEND(' ');

  uint8_t castling = POSITION_CASTLING;

  if (castling == 0) {
    APPEND('-');
  }
  else {
    if (castling & CASTLE_WHITE_KING) {
      APPEND('K');
    }
    if (castling & CASTLE_WHITE_QUEEN) {
      APPEND('Q');
    }
    if (castling & CASTLE_BLACK_KING) {
      APPEND('k');
    }
    if (castling & CASTLE_BLACK_QUEEN) {
      APPEND('q');
    }
  }

  APPEND(' ');

  if (POSITION_EP_SQUARE == SQUARE_NONE) {
    APPEND('-');
  }
  else {
    APPEND(
      (char)('a' + SQUARE_FILE(POSITION_EP_SQUARE))
    );
    APPEND(
      (char)('1' + SQUARE_RANK(POSITION_EP_SQUARE))
    );
  }

  int written = snprintf(
    cursor,
    (size_t)(end - cursor),
    " %u 1",
    POSITION_HALFMOVE
  );

#undef APPEND

  return
    written < 0 ||
    (size_t)written >= (size_t)(end - cursor);
}

int minti_host_selfplay(
  const char *starting_fen,
  char *positions,
  size_t position_capacity,
  size_t *position_count,
  double *result
)
{
  if (
    starting_fen == NULL ||
    positions == NULL ||
    position_count == NULL ||
    result == NULL
  ) {
    return MINTI_HOST_INVALID_ARGUMENT;
  }

  *position_count = 0;

  int status = ensure_initialized();
  if (status != MINTI_HOST_OK) {
    return status;
  }

  if (position_from_fen(starting_fen) != 0) {
    return MINTI_HOST_INVALID_FEN;
  }

  repetition_game_reset();

  size_t count = 0;
  double outcome = 0.5;

  while (count < MINTI_HOST_MAX_GAME_PLIES) {
    if (count >= position_capacity) {
      return MINTI_HOST_BUFFER_TOO_SMALL;
    }

    char *destination =
      positions + count * MINTI_HOST_FEN_CAPACITY;

    if (
      position_to_fen(
        destination,
        MINTI_HOST_FEN_CAPACITY
      ) != 0
    ) {
      return MINTI_HOST_BUFFER_TOO_SMALL;
    }

    ++count;
    *position_count = count;

    if (POSITION_HALFMOVE >= 100) {
      outcome = 0.5;
      break;
    }

    search_result_t search;

    if (
      search_position(
        SELFPLAY_DEPTH,
        &search
      ) != 0
    ) {
      return MINTI_HOST_SEARCH_FAILED;
    }

    if (!search.has_move) {
      if (
        search.score <=
          -SEARCH_SCORE_MATE + MAX_PLY
      ) {
        outcome = POSITION_SIDE == COLOR_WHITE
          ? 0.0
          : 1.0;
      }
      else {
        outcome = 0.5;
      }

      break;
    }

    undo_t undo;
    make_move(&search.best_move, &undo);

    if (
      repetition_game_push() ||
      POSITION_HALFMOVE >= 100
    ) {
      outcome = 0.5;
      break;
    }
  }

  *result = outcome;
  return MINTI_HOST_OK;
}
