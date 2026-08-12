#ifndef MINTI_HOST_COMPAT_H
#define MINTI_HOST_COMPAT_H

#include <stdint.h>

// Shouldn't lead to breaking different behavior
typedef uint32_t uint24_t;
typedef int32_t int24_t;

// include host memory map before engine files ever try to include from ../ce/
#include "memory_map.h"

#endif
