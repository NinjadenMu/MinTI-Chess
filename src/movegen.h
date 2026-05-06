#ifndef MOVEGEN_H
#define MOVEGEN_H 1

#include "attributes.h"
#include "types.h"

#define INLINE static inline __attribute__((always_inline))

#define N_OFFSET (-16)
#define NE_OFFSET (-15)
#define E_OFFSET (1)
#define SE_OFFSET (17)
#define S_OFFSET (16)
#define SW_OFFSET (15)
#define W_OFFSET (-1)
#define NW_OFFSET (-17)

typedef Move MoveListStack[MAX_DEPTH * 32];

#endif