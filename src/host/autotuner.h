#ifndef MINTI_HOST_AUTOTUNER_H
#define MINTI_HOST_AUTOTUNER_H

#include <stddef.h>

int autotuner_generate(
  const char *output_path,
  size_t maximum_games
);

int autotuner_tune(
  const char *dataset_path,
  const char *constants_path,
  size_t iterations,
  size_t batch_size
);

#endif
