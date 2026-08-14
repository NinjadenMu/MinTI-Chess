/**
 * @file evaluation_constants.h
 * 
 * Interface for getting and setting evaluation parameters
 * 
 * For the calculator, the enums directly are the interface for modifying 
 * evaluation parameters.
 * 
 * For tuning on the host, getter and setter functions are exposed.
 */

#ifndef MINTI_ENGINE_EVALUATION_CONSTANTS_H
#define MINTI_ENGINE_EVALUATION_CONSTANTS_H

#include <stdint.h>

enum {
  EVAL_PST_INDEX_PAWN_OPENING = 0,
  EVAL_PST_INDEX_PAWN_ENDGAME,
  EVAL_PST_INDEX_KNIGHT,
  EVAL_PST_INDEX_BISHOP,
  EVAL_PST_INDEX_ROOK,
  EVAL_PST_INDEX_QUEEN,
  EVAL_PST_INDEX_KING_OPENING,
  EVAL_PST_INDEX_KING_ENDGAME,
  EVAL_PST_COUNT
};

// Values used by calculator and as starting point for tuning

enum {
  /*
   * PST offsets are subtracted from the true value, preserving
   * their true values with an unsigned PST.
   */
  EVAL_PAWN_BASE = 64,
  EVAL_KNIGHT_BASE = 235,
  EVAL_BISHOP_BASE = 302,
  EVAL_ROOK_BASE = 469,
  EVAL_QUEEN_BASE = 889,

  EVAL_DOUBLED_PAWN_PENALTY = 13,
  EVAL_ISOLATED_PAWN_PENALTY = 6,
  EVAL_BISHOP_PAIR_BONUS = 7,
  EVAL_ROOK_OPEN_FILE_BONUS = 11,
  EVAL_TEMPO_BONUS = 3,

  // the below are not tuned
  EVAL_PAWN_VALUE   = 100,
  EVAL_KNIGHT_VALUE = 320,
  EVAL_BISHOP_VALUE = 330,
  EVAL_ROOK_VALUE   = 500,
  EVAL_QUEEN_VALUE  = 950,
  EVAL_ENDGAME_MATERIAL = 1010,
  EVAL_MOPUP_EDGE_WEIGHT = 25,
  EVAL_MOPUP_KING_WEIGHT = 10
};

extern const uint8_t evaluation_default_pst_source[8][64];

#ifdef MINTI_HOST

enum {
  EVAL_TUNABLE_DOUBLED_PAWN = 0,
  EVAL_TUNABLE_ISOLATED_PAWN,
  EVAL_TUNABLE_BISHOP_PAIR,
  EVAL_TUNABLE_ROOK_OPEN_FILE,
  EVAL_TUNABLE_TEMPO,
  EVAL_TUNABLE_SCALAR_COUNT,

  EVAL_TUNABLE_PST_COUNT = EVAL_PST_COUNT * 64,
  EVAL_TUNABLE_COUNT =
    EVAL_TUNABLE_PST_COUNT +
    EVAL_TUNABLE_SCALAR_COUNT
};

/**
 * @brief populates `parameters` with active values
 * @param[out] `parameters` - see below
 * 
 * `parameters[0:512]` are "combined table" values (base + PST adjustment)
 * Combining these values is more "correct" for SPSA, since tuning base 
 * values and PST values as independent parameters means multiple solutions 
 * can lead to the same evaluation, e.g. +10 to the base value and -10 to PST 
 * values is the same as -20 to the base value and +20 to PST values.
 *
 * The final five parameters are scalar evaluation terms
 */
void evaluation_host_get_tunables(
  double parameters[EVAL_TUNABLE_COUNT]
);

/**
 * @brief stages `parameters` vector, requires rebuilding evaluation
 */
void evaluation_host_stage_tunables(
  const double parameters[EVAL_TUNABLE_COUNT]
);

/*
 * getters for individual values
 */
uint16_t evaluation_host_piece_base(uint8_t piece_type);
uint16_t evaluation_host_scalar(uint8_t scalar);
uint8_t evaluation_host_pst(uint8_t table, uint8_t square);

#endif

#endif
