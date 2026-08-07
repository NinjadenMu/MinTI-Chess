/**
 * @file evaluation.c
 *
 * Implementation of evaluation.h
 */

#include <stdint.h>
#include <string.h>

#include "../ce/memory_map.h"
#include "evaluation.h"
#include "types.h"

enum {
  EVAL_PHASE_OPENING = 0,
  EVAL_PHASE_ENDGAME = 1,

  /*
   * PST offsets are subtracted from the true value, preserving
   * p=100, n=320, b=330, r=500, q=950 with an unsigned PST.
   */
  EVAL_PAWN_BASE   = 80,
  EVAL_KNIGHT_BASE = 270,
  EVAL_BISHOP_BASE = 310,
  EVAL_ROOK_BASE   = 495,
  EVAL_QUEEN_BASE  = 930,

  EVAL_PAWN_VALUE   = 100,
  EVAL_KNIGHT_VALUE = 320,
  EVAL_BISHOP_VALUE = 330,
  EVAL_ROOK_VALUE   = 500,
  EVAL_QUEEN_VALUE  = 950,

  EVAL_DOUBLED_PAWN_PENALTY = 20,
  EVAL_ISOLATED_PAWN_PENALTY = 20,
  EVAL_BISHOP_PAIR_BONUS = 20,
  EVAL_ROOK_OPEN_FILE_BONUS = 10,

  EVAL_TEMPO_BONUS = 10,

  EVAL_ENDGAME_MATERIAL = 1010
};

/*
 * Tables stored from white's perspective with a1 at index 0, offsets added 
 * to make all values unsigned
 * 
 * Otherwise, more or less taken straight from Tomasz Michniewski's Simplified 
 * Evaluation Function:
 * https://www.chessprogramming.org/Simplified_Evaluation_Function
 */
static const uint8_t pst_source[8][64] = {
  {
    // pawn opening/middlegame
    20, 20, 20, 20, 20, 20, 20, 20,
    25, 30, 30,  0,  0, 30, 30, 25,
    25, 15, 10, 20, 20, 10, 15, 25,
    20, 20, 20, 40, 40, 20, 20, 20,
    25, 25, 30, 45, 45, 30, 25, 25,
    30, 30, 40, 50, 50, 40, 30, 30,
    70, 70, 70, 70, 70, 70, 70, 70,
    20, 20, 20, 20, 20, 20, 20, 20
  },
  {
    // pawn endgame
    20, 20, 20, 20, 20, 20, 20, 20,
    20, 20, 20, 20, 20, 20, 20, 20,
    25, 25, 30, 35, 35, 30, 25, 25,
    30, 30, 35, 40, 40, 35, 30, 30,
    40, 40, 45, 50, 50, 45, 40, 40,
    55, 55, 60, 65, 65, 60, 55, 55,
    85, 85, 90, 95, 95, 90, 85, 85,
    20, 20, 20, 20, 20, 20, 20, 20
  },
  {
    // knight
     0, 10, 20, 20, 20, 20, 10,  0,
    10, 30, 50, 55, 55, 50, 30, 10,
    20, 55, 60, 65, 65, 60, 55, 20,
    20, 50, 65, 70, 70, 65, 50, 20,
    20, 50, 65, 70, 70, 65, 50, 20,
    20, 55, 60, 65, 65, 60, 55, 20,
    10, 30, 50, 55, 55, 50, 30, 10,
     0, 10, 20, 20, 20, 20, 10,  0
  },
  {
    // bishop
     0, 10, 10, 10, 10, 10, 10,  0,
    10, 25, 20, 20, 20, 20, 25, 10,
    10, 30, 30, 30, 30, 30, 30, 10,
    10, 20, 30, 30, 30, 30, 20, 10,
    10, 20, 30, 30, 30, 30, 20, 10,
    10, 30, 30, 30, 30, 30, 30, 10,
    10, 25, 20, 20, 20, 20, 25, 10,
     0, 10, 10, 10, 10, 10, 10,  0
  },
  {
    // rook
     5,  5,  5, 10, 10,  5,  5,  5,
     0,  5,  5,  5,  5,  5,  5,  0,
     5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,
     5,  5,  5,  5,  5,  5,  5,  5,
    10, 15, 15, 15, 15, 15, 15, 10,
     5,  5,  5,  5,  5,  5,  5,  5
  },
  {
    // queen
     0, 10, 10, 15, 15, 10, 10,  0,
    10, 20, 20, 20, 20, 20, 20, 10,
    10, 20, 25, 25, 25, 25, 20, 10,
    15, 20, 25, 25, 25, 25, 20, 15,
    15, 20, 25, 25, 25, 25, 20, 15,
    10, 20, 25, 25, 25, 25, 20, 10,
    10, 20, 20, 20, 20, 20, 20, 10,
     0, 10, 10, 15, 15, 10, 10,  0
  },
  {
    // king opening/middlegame
    70, 80, 60, 50, 50, 60, 80, 70,
    70, 70, 50, 50, 50, 50, 70, 70,
    40, 30, 30, 30, 30, 30, 30, 40,
    30, 20, 20, 20, 20, 20, 20, 30,
    20, 10, 10, 10, 10, 10, 10, 20,
    10,  0,  0,  0,  0,  0,  0, 10,
    10,  0,  0,  0,  0,  0,  0, 10,
    10,  0,  0,  0,  0,  0,  0, 10
  },
  {
    // king endgame
     0, 20, 20, 20, 20, 20, 20,  0,
    20, 30, 40, 50, 50, 40, 30, 20,
    20, 40, 70, 80, 80, 70, 40, 20,
    20, 40, 80, 90, 90, 80, 40, 20,
    20, 40, 80, 90, 90, 80, 40, 20,
    20, 40, 70, 80, 80, 70, 40, 20,
    20, 30, 40, 50, 50, 40, 30, 20,
     0, 20, 20, 20, 20, 20, 20,  0
  }
};

static uint8_t *const pst_destinations[8] = {
  EVAL_PST_PAWN_OPENING,
  EVAL_PST_PAWN_ENDGAME,
  EVAL_PST_KNIGHT,
  EVAL_PST_BISHOP,
  EVAL_PST_ROOK,
  EVAL_PST_QUEEN,
  EVAL_PST_KING_OPENING,
  EVAL_PST_KING_ENDGAME
};

static inline uint8_t relative_square(
  uint8_t piece,
  uint8_t square
)
{
  return PIECE_COLOR(piece) == COLOR_BLACK
    ? SQUARE_FLIP(square)
    : square;
}

static inline uint24_t isolated_penalty(uint8_t count)
{
  uint24_t value = count;

  return value * EVAL_ISOLATED_PAWN_PENALTY;
}

static inline uint24_t open_file_rook_bonus(uint8_t count)
{
  uint24_t value = count;

  return value * EVAL_ROOK_OPEN_FILE_BONUS;
}

static inline uint8_t file_is_open(uint8_t file)
{
  uint8_t (*const pawn_counts)[8] =
    EVAL_PAWN_FILE_COUNT;

  return
    pawn_counts[0][file] == 0 &&
    pawn_counts[1][file] == 0;
}

static inline void add_pawn_file(
  uint8_t color_index,
  uint8_t file
)
{
  uint8_t (*const pawn_counts)[8] =
    EVAL_PAWN_FILE_COUNT;
  uint8_t *const counts =
    pawn_counts[color_index];
  uint8_t (*const rook_counts)[8] =
    EVAL_ROOK_FILE_COUNT;
  uint24_t *const score = EVAL_SCORE;
  uint8_t count = counts[file];

  if (
    count == 0 &&
    pawn_counts[color_index ^ 1][file] == 0
  ) {
    score[0] -= open_file_rook_bonus(
      rook_counts[0][file]
    );
    score[1] -= open_file_rook_bonus(
      rook_counts[1][file]
    );
  }

  if (count != 0) {
    score[color_index] -= EVAL_DOUBLED_PAWN_PENALTY;

    if (
      (file == 0 || counts[file - 1] == 0) &&
      (file == 7 || counts[file + 1] == 0)
    ) {
      score[color_index] -= EVAL_ISOLATED_PAWN_PENALTY;
    }
  }
  else {
    uint8_t left_count =
      file == 0 ? 0 : counts[file - 1];
    uint8_t right_count =
      file == 7 ? 0 : counts[file + 1];

    if (left_count == 0 && right_count == 0) {
      score[color_index] -= EVAL_ISOLATED_PAWN_PENALTY;
    }

    // adding a pawn can unisolate neighboring pawns
    if (
      left_count != 0 &&
      (file == 1 || counts[file - 2] == 0)
    ) {
      score[color_index] += isolated_penalty(left_count);
    }
    if (
      right_count != 0 &&
      (file == 6 || counts[file + 2] == 0)
    ) {
      score[color_index] += isolated_penalty(right_count);
    }
  }

  counts[file] = count + 1;
}

static inline void remove_pawn_file(
  uint8_t color_index,
  uint8_t file
)
{
  uint8_t (*const pawn_counts)[8] =
    EVAL_PAWN_FILE_COUNT;
  uint8_t *const counts =
    pawn_counts[color_index];
  uint8_t (*const rook_counts)[8] =
    EVAL_ROOK_FILE_COUNT;
  uint24_t *const score = EVAL_SCORE;
  uint8_t count = counts[file];

  if (
    count == 1 &&
    pawn_counts[color_index ^ 1][file] == 0
  ) {
    score[0] += open_file_rook_bonus(
      rook_counts[0][file]
    );
    score[1] += open_file_rook_bonus(
      rook_counts[1][file]
    );
  }

  if (count > 1) {
    score[color_index] += EVAL_DOUBLED_PAWN_PENALTY;

    if (
      (file == 0 || counts[file - 1] == 0) &&
      (file == 7 || counts[file + 1] == 0)
    ) {
      score[color_index] += EVAL_ISOLATED_PAWN_PENALTY;
    }
  }
  else {
    uint8_t left_count =
      file == 0 ? 0 : counts[file - 1];
    uint8_t right_count =
      file == 7 ? 0 : counts[file + 1];

    if (left_count == 0 && right_count == 0) {
      score[color_index] += EVAL_ISOLATED_PAWN_PENALTY;
    }

    if (
      left_count != 0 &&
      (file == 1 || counts[file - 2] == 0)
    ) {
      score[color_index] -= isolated_penalty(left_count);
    }

    if (
      right_count != 0 &&
      (file == 6 || counts[file + 2] == 0)
    ) {
      score[color_index] -= isolated_penalty(right_count);
    }
  }

  counts[file] = count - 1;
}

static inline void add_piece(
  uint8_t piece,
  uint8_t square
)
{
  uint24_t *const score = EVAL_SCORE;
  uint24_t (*const pawn_king_score)[2] =
    EVAL_PAWN_KING_SCORE;
  uint24_t *const nonpawn_material =
    EVAL_NONPAWN_MATERIAL;
  uint8_t *const bishop_count = EVAL_BISHOP_COUNT;
  uint8_t (*const rook_file_count)[8] =
    EVAL_ROOK_FILE_COUNT;

  uint8_t color_index =
    COLOR_INDEX(PIECE_COLOR(piece));
  uint8_t relative =
    relative_square(piece, square);

#define ADD_NONPAWN(base_, material_, table_)                                  \
  do {                                                                         \
    score[color_index] += base_;                                               \
    score[color_index] += table_[relative];                                    \
    nonpawn_material[color_index] += material_;                                \
  } while (0)

  switch (PIECE_TYPE(piece)) {
    case PIECE_PAWN:
      score[color_index] += EVAL_PAWN_BASE;

      pawn_king_score[EVAL_PHASE_OPENING][color_index] +=
        EVAL_PST_PAWN_OPENING[relative];
      pawn_king_score[EVAL_PHASE_ENDGAME][color_index] +=
        EVAL_PST_PAWN_ENDGAME[relative];

      add_pawn_file(
        color_index,
        SQUARE_FILE(relative)
      );
      break;

    case PIECE_KNIGHT:
      ADD_NONPAWN(
        EVAL_KNIGHT_BASE,
        EVAL_KNIGHT_VALUE,
        EVAL_PST_KNIGHT
      );
      break;

    case PIECE_KING:
      pawn_king_score[EVAL_PHASE_OPENING][color_index] +=
        EVAL_PST_KING_OPENING[relative];
      pawn_king_score[EVAL_PHASE_ENDGAME][color_index] +=
        EVAL_PST_KING_ENDGAME[relative];
      break;

    case PIECE_BISHOP:
      ADD_NONPAWN(
        EVAL_BISHOP_BASE,
        EVAL_BISHOP_VALUE,
        EVAL_PST_BISHOP
      );

      if (bishop_count[color_index] == 1) {
        score[color_index] += EVAL_BISHOP_PAIR_BONUS;
      }

      ++bishop_count[color_index];
      break;

    case PIECE_ROOK: {
      uint8_t file = SQUARE_FILE(square);

      ADD_NONPAWN(
        EVAL_ROOK_BASE,
        EVAL_ROOK_VALUE,
        EVAL_PST_ROOK
      );

      ++rook_file_count[color_index][file];

      if (file_is_open(file)) {
        score[color_index] +=
          EVAL_ROOK_OPEN_FILE_BONUS;
      }
      break;
    }

    case PIECE_QUEEN:
      ADD_NONPAWN(
        EVAL_QUEEN_BASE,
        EVAL_QUEEN_VALUE,
        EVAL_PST_QUEEN
      );
      break;

    default:
      break;
  }

#undef ADD_NONPAWN
}

static inline void remove_piece(
  uint8_t piece,
  uint8_t square
)
{
  uint24_t *const score = EVAL_SCORE;
  uint24_t (*const pawn_king_score)[2] =
    EVAL_PAWN_KING_SCORE;
  uint24_t *const nonpawn_material =
    EVAL_NONPAWN_MATERIAL;
  uint8_t *const bishop_count = EVAL_BISHOP_COUNT;
  uint8_t (*const rook_file_count)[8] =
    EVAL_ROOK_FILE_COUNT;

  uint8_t color_index =
    COLOR_INDEX(PIECE_COLOR(piece));
  uint8_t relative =
    relative_square(piece, square);

#define REMOVE_NONPAWN(base_, material_, table_)                               \
  do {                                                                         \
    score[color_index] -= base_;                                               \
    score[color_index] -= table_[relative];                                    \
    nonpawn_material[color_index] -= material_;                                \
  } while (0)

  switch (PIECE_TYPE(piece)) {
    case PIECE_PAWN:
      remove_pawn_file(
        color_index,
        SQUARE_FILE(relative)
      );

      score[color_index] -= EVAL_PAWN_BASE;

      pawn_king_score[EVAL_PHASE_OPENING][color_index] -=
        EVAL_PST_PAWN_OPENING[relative];
      pawn_king_score[EVAL_PHASE_ENDGAME][color_index] -=
        EVAL_PST_PAWN_ENDGAME[relative];
      break;

    case PIECE_KNIGHT:
      REMOVE_NONPAWN(
        EVAL_KNIGHT_BASE,
        EVAL_KNIGHT_VALUE,
        EVAL_PST_KNIGHT
      );
      break;

    case PIECE_KING:
      pawn_king_score[EVAL_PHASE_OPENING][color_index] -=
        EVAL_PST_KING_OPENING[relative];
      pawn_king_score[EVAL_PHASE_ENDGAME][color_index] -=
        EVAL_PST_KING_ENDGAME[relative];
      break;

    case PIECE_BISHOP:
      if (bishop_count[color_index] == 2) {
        score[color_index] -= EVAL_BISHOP_PAIR_BONUS;
      }

      --bishop_count[color_index];

      REMOVE_NONPAWN(
        EVAL_BISHOP_BASE,
        EVAL_BISHOP_VALUE,
        EVAL_PST_BISHOP
      );
      break;

    case PIECE_ROOK: {
      uint8_t file = SQUARE_FILE(square);

      if (file_is_open(file)) {
        score[color_index] -=
          EVAL_ROOK_OPEN_FILE_BONUS;
      }

      --rook_file_count[color_index][file];

      REMOVE_NONPAWN(
        EVAL_ROOK_BASE,
        EVAL_ROOK_VALUE,
        EVAL_PST_ROOK
      );
      break;
    }

    case PIECE_QUEEN:
      REMOVE_NONPAWN(
        EVAL_QUEEN_BASE,
        EVAL_QUEEN_VALUE,
        EVAL_PST_QUEEN
      );
      break;

    default:
      break;
  }

#undef REMOVE_NONPAWN
}

static inline void move_piece(
  uint8_t piece,
  uint8_t from,
  uint8_t to
)
{
  uint24_t *const score = EVAL_SCORE;
  uint24_t (*const pawn_king_score)[2] =
    EVAL_PAWN_KING_SCORE;
  uint8_t (*const rook_file_count)[8] =
    EVAL_ROOK_FILE_COUNT;

  uint8_t color_index =
    COLOR_INDEX(PIECE_COLOR(piece));
  uint8_t relative_from =
    relative_square(piece, from);
  uint8_t relative_to =
    relative_square(piece, to);

#define MOVE_PST(target_, table_)                                              \
  do {                                                                         \
    (target_) -= table_[relative_from];                                        \
    (target_) += table_[relative_to];                                          \
  } while (0)

  switch (PIECE_TYPE(piece)) {
    case PIECE_PAWN:
      MOVE_PST(
        pawn_king_score[EVAL_PHASE_OPENING][color_index],
        EVAL_PST_PAWN_OPENING
      );
      MOVE_PST(
        pawn_king_score[EVAL_PHASE_ENDGAME][color_index],
        EVAL_PST_PAWN_ENDGAME
      );

      if (
        SQUARE_FILE(relative_from) !=
        SQUARE_FILE(relative_to)
      ) {
        remove_pawn_file(
          color_index,
          SQUARE_FILE(relative_from)
        );
        add_pawn_file(
          color_index,
          SQUARE_FILE(relative_to)
        );
      }
      break;

    case PIECE_KNIGHT:
      MOVE_PST(
        score[color_index],
        EVAL_PST_KNIGHT
      );
      break;

    case PIECE_KING:
      MOVE_PST(
        pawn_king_score[EVAL_PHASE_OPENING][color_index],
        EVAL_PST_KING_OPENING
      );
      MOVE_PST(
        pawn_king_score[EVAL_PHASE_ENDGAME][color_index],
        EVAL_PST_KING_ENDGAME
      );
      break;

    case PIECE_BISHOP:
      MOVE_PST(
        score[color_index],
        EVAL_PST_BISHOP
      );
      break;

    case PIECE_ROOK: {
      uint8_t from_file = SQUARE_FILE(from);
      uint8_t to_file = SQUARE_FILE(to);

      MOVE_PST(
        score[color_index],
        EVAL_PST_ROOK
      );

      if (from_file != to_file) {
        if (file_is_open(from_file)) {
          score[color_index] -=
            EVAL_ROOK_OPEN_FILE_BONUS;
        }

        --rook_file_count[color_index][from_file];
        ++rook_file_count[color_index][to_file];

        if (file_is_open(to_file)) {
          score[color_index] +=
            EVAL_ROOK_OPEN_FILE_BONUS;
        }
      }
      break;
    }

    case PIECE_QUEEN:
      MOVE_PST(
        score[color_index],
        EVAL_PST_QUEEN
      );
      break;

    default:
      break;
  }

#undef MOVE_PST
}

void evaluation_clear(void)
{
  memset(
    EVAL_SCORE,
    0,
    2 * sizeof(uint24_t)
  );
  memset(
    EVAL_PAWN_KING_SCORE,
    0,
    4 * sizeof(uint24_t)
  );
  memset(
    EVAL_NONPAWN_MATERIAL,
    0,
    2 * sizeof(uint24_t)
  );
  memset(
    EVAL_PAWN_FILE_COUNT,
    0,
    16
  );
  memset(
    EVAL_BISHOP_COUNT,
    0,
    2
  );

  memset(
    EVAL_ROOK_FILE_COUNT,
    0,
    16
  );
}

//__attribute__((noinline, optnone))
void evaluation_init(void)
{
  for (uint8_t table = 0; table < 8; ++table) {
    uint8_t *destination = pst_destinations[table];
    const uint8_t *source = pst_source[table];

    for (uint8_t rank = 0; rank < 8; ++rank) {
      for (uint8_t file = 0; file < 8; ++file) {
        destination[SQUARE(file, rank)] =
          source[(rank << 3) | file];
      }
    }
  }

  evaluation_clear();
}

void evaluation_add_piece(
  uint8_t piece,
  uint8_t square
)
{
  add_piece(piece, square);
}

void evaluation_remove_piece(
  uint8_t piece,
  uint8_t square
)
{
  remove_piece(piece, square);
}

void evaluation_move_piece(
  uint8_t piece,
  uint8_t from,
  uint8_t to
)
{
  move_piece(piece, from, to);
}

void evaluation_make_move(
  const move_t *move,
  uint8_t moving_piece,
  uint8_t placed_piece,
  uint8_t captured_piece,
  uint8_t captured_square
)
{
  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t flags = move->flags;

  if (captured_piece != PIECE_EMPTY) {
    remove_piece(captured_piece, captured_square);
  }

  if (flags & MF_PROMO) {
    remove_piece(moving_piece, from);
    add_piece(placed_piece, to);
  }
  else {
    move_piece(moving_piece, from, to);
  }

  if (flags & MF_CASTLE) {
    uint8_t rook_from = to > from
      ? to + 1
      : to - 2;
    uint8_t rook_to = (from + to) >> 1;
    uint8_t rook =
      PIECE_COLOR(moving_piece) | PIECE_ROOK;

    move_piece(rook, rook_from, rook_to);
  }
}

void evaluation_unmake_move(
  const move_t *move,
  uint8_t moving_piece,
  uint8_t placed_piece,
  uint8_t captured_piece,
  uint8_t captured_square
)
{
  uint8_t from = move->from;
  uint8_t to = move->to;
  uint8_t flags = move->flags;

  if (flags & MF_CASTLE) {
    uint8_t rook_from = to > from
      ? to + 1
      : to - 2;
    uint8_t rook_to = (from + to) >> 1;
    uint8_t rook =
      PIECE_COLOR(moving_piece) | PIECE_ROOK;

    move_piece(rook, rook_to, rook_from);
  }

  if (flags & MF_PROMO) {
    remove_piece(placed_piece, to);
    add_piece(moving_piece, from);
  }
  else {
    move_piece(moving_piece, to, from);
  }

  if (captured_piece != PIECE_EMPTY) {
    add_piece(captured_piece, captured_square);
  }
}

//__attribute__((noinline, optnone))
eval_t evaluate_position(void)
{
  uint24_t *const score = EVAL_SCORE;
  uint24_t (*const pawn_king_score)[2] =
    EVAL_PAWN_KING_SCORE;
  uint24_t *const nonpawn_material =
    EVAL_NONPAWN_MATERIAL;

  uint8_t friendly_index =
    COLOR_INDEX(POSITION_SIDE);
  uint8_t enemy_index = friendly_index ^ 1;

  uint8_t friendly_phase =
    nonpawn_material[enemy_index] <=
      EVAL_ENDGAME_MATERIAL
    ? EVAL_PHASE_ENDGAME
    : EVAL_PHASE_OPENING;

  uint8_t enemy_phase =
    nonpawn_material[friendly_index] <=
      EVAL_ENDGAME_MATERIAL
    ? EVAL_PHASE_ENDGAME
    : EVAL_PHASE_OPENING;

  uint24_t friendly_score =
    score[friendly_index] +
    pawn_king_score[friendly_phase][friendly_index];

  uint24_t enemy_score =
    score[enemy_index] +
    pawn_king_score[enemy_phase][enemy_index];

  return
    (int24_t)friendly_score -
    (int24_t)enemy_score +
    EVAL_TEMPO_BONUS;
}
