/**
 * @file move_picker.c
 *
 * Implementation of move_picker.h
 */

#include <stdint.h>

#include "move_picker.h"
#include "movegen.h"
#include "types.h"

enum {
  PICKER_STAGE_CAPTURES,
  PICKER_STAGE_QUIETS,
  PICKER_STAGE_DONE,
  PICKER_STAGE_OVERFLOW
};

static move_t *move_picker_pick(move_picker_t *picker)
{
  return &picker->moves[picker->index++];
}

void move_picker_init(
  move_picker_t *picker,
  move_t *moves,
  uint8_t capacity,
  const move_t *preferred,
  const uint8_t has_preferred
)
{
  picker->moves = moves;
  picker->capacity = capacity;
  picker->count = 0;
  picker->index = 0;
  picker->stage = PICKER_STAGE_CAPTURES;
  picker->has_preferred = has_preferred;
  picker->preferred_pending = has_preferred;
  if (has_preferred) {
    picker->preferred = *preferred;
  }
}

uint8_t move_picker_next(
  move_picker_t *picker,
  move_t **move
)
{
  if (picker->preferred_pending) {
    picker->preferred_pending = 0;
    *move = &picker->preferred;

    return MOVE_PICKER_MOVE;
  }

  while (picker->index == picker->count) {
    uint8_t generation_stage;

    switch (picker->stage) {
      case PICKER_STAGE_CAPTURES:
        generation_stage = GEN_CAPTURES;
        picker->stage = PICKER_STAGE_QUIETS;
        break;

      case PICKER_STAGE_QUIETS:
        generation_stage = GEN_QUIETS;
        picker->stage = PICKER_STAGE_DONE;
        break;

      case PICKER_STAGE_DONE:
        return MOVE_PICKER_DONE;

      default:
        return MOVE_PICKER_OVERFLOW;
    }

    picker->count = movegen_generate(
      picker->moves,
      picker->capacity,
      generation_stage
    );
    picker->index = 0;

    if (picker->count == MOVEGEN_OVERFLOW) {
      picker->count = 0;
      picker->stage = PICKER_STAGE_OVERFLOW;
      return MOVE_PICKER_OVERFLOW;
    }
  }

  *move = move_picker_pick(picker);
  return MOVE_PICKER_MOVE;
}

move_t *move_picker_end(const move_picker_t *picker)
{
  return picker->moves + picker->count;
}
