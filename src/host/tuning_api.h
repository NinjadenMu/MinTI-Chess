#ifndef MINTI_HOST_TUNING_API_H
#define MINTI_HOST_TUNING_API_H

#include <stddef.h>
#include <stdint.h>

enum {
  MINTI_HOST_OK = 0,
  MINTI_HOST_INVALID_ARGUMENT,
  MINTI_HOST_INITIALIZATION_FAILED,
  MINTI_HOST_INVALID_FEN,
  MINTI_HOST_SEARCH_FAILED,
  MINTI_HOST_BUFFER_TOO_SMALL,

  MINTI_HOST_FEN_CAPACITY = 128,
  MINTI_HOST_MAX_GAME_PLIES = 256
};

/**
 * @brief initializes engine
 */
int minti_host_init(void);

/**
 * @return EVAL_TUNABLE_COUNT.
 */
size_t minti_host_tunable_count(void);

/**
 * @param[out] parameters - destination for active parameters
 */
int minti_host_get_tunables(double *parameters);

/**
 * @brief sets active evaluation constants to contents of `parameters`
 * 
 * Still requires rebuilding evaluation
 */
int minti_host_set_tunables(const double *parameters);

/**
 * @brief evaluates list of FEN strings with quiescence
 * 
 * @param[in] fens - list of FEN strings to evaluate
 * @param[in] count - number of FEN strings
 * @param[out] scores - destinations to write evaluations
 * @param[out] failed_index - index of first un-evaluated FEN
 */
int minti_host_score_fens(
  const char *const *fens,
  size_t count,
  int32_t *scores,
  size_t *failed_index
);

/**
 * @brief plays a self-play game
 * 
 * @param[out] positions - buffer to write FEN strings of game, 
 *                         size must be >= 128 * `position_capacity`
 * @param[in] position_capacity - max number of FEN strings to write
 * @param[out] position_count - number of FEN strings written
 * @param[out] result - 0.0 on loss, 0.5 on draw, 1.0 on win for white
 */
int minti_host_selfplay(
  const char *starting_fen,
  char *positions,
  size_t position_capacity,
  size_t *position_count,
  double *result
);

#endif
