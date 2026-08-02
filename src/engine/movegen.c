/**
 * @file movegen.c
 *
 * Implementation of movegen.h, staged pseudolegal move generation
 */

#include <stdint.h>

#include "../ce/memory_map.h"
#include "movegen.h"
#include "types.h"

uint8_t movegen_generate(
  move_t *out,
  uint8_t capacity,
  uint8_t stage
)
{
  uint8_t *const board = BOARD;
  uint8_t *piece_list;
  uint8_t side;
  uint8_t piece_count;
  uint8_t want_captures;
  uint8_t want_quiets;
  uint8_t ep_square;
  uint8_t generated = 0;
  uint8_t index;
  uint8_t from;
  uint8_t to;
  uint8_t target;
  uint8_t rank;

  want_captures = stage & GEN_CAPTURES;
  want_quiets = stage & GEN_QUIETS;

  if (!(want_captures | want_quiets)) {
    return 0;
  }

  side = POSITION_SIDE;
  ep_square = want_captures ? POSITION_EP_SQUARE : SQUARE_NONE;
  piece_list = PIECE_LIST[COLOR_INDEX(side)];
  piece_count = PIECE_COUNT[COLOR_INDEX(side)];

#define EMIT_MOVE(destination_, flags_)                                        \
  do {                                                                         \
    if (generated == capacity) {                                               \
      return MOVEGEN_OVERFLOW;                                                 \
    }                                                                          \
                                                                               \
    out->from = from;                                                          \
    out->to = destination_;                                                    \
    out->flags = flags_;                                                       \
    out->score = 0;                                                            \
    ++out;                                                                     \
    ++generated;                                                               \
  } while (0)

#define EMIT_PROMOTIONS(destination_, base_flags_)                             \
  do {                                                                         \
    EMIT_MOVE(                                                                 \
      destination_,                                                            \
      base_flags_ | MF_PROMO | MF_PROMO_QUEEN                                  \
    );                                                                         \
    EMIT_MOVE(                                                                 \
      destination_,                                                            \
      base_flags_ | MF_PROMO | MF_PROMO_KNIGHT                                 \
    );                                                                         \
    EMIT_MOVE(                                                                 \
      destination_,                                                            \
      base_flags_ | MF_PROMO | MF_PROMO_ROOK                                   \
    );                                                                         \
    EMIT_MOVE(                                                                 \
      destination_,                                                            \
      base_flags_ | MF_PROMO | MF_PROMO_BISHOP                                 \
    );                                                                         \
  } while (0)

#define GENERATE_PAWN_CAPTURE(delta_, promotes_)                               \
  do {                                                                         \
    to = from + delta_;                                                        \
                                                                               \
    if (!SQUARE_OFFBOARD(to)) {                                                \
      target = board[to];                                                      \
                                                                               \
      if (target != PIECE_EMPTY) {                                             \
        if ((target ^ side) & COLOR_BLACK) {                                   \
          if (promotes_) {                                                     \
            EMIT_PROMOTIONS(to, MF_CAPTURE);                                   \
          }                                                                    \
          else {                                                               \
            EMIT_MOVE(to, MF_CAPTURE);                                         \
          }                                                                    \
        }                                                                      \
      }                                                                        \
      else if (to == ep_square) {                                              \
        EMIT_MOVE(to, MF_CAPTURE | MF_EP);                                     \
      }                                                                        \
    }                                                                          \
  } while (0)

#define GENERATE_LEAPER_MOVE(delta_)                                           \
  do {                                                                         \
    to = from + (delta_);                                                      \
                                                                               \
    if (!SQUARE_OFFBOARD(to)) {                                                \
      target = board[to];                                                      \
                                                                               \
      if (target == PIECE_EMPTY) {                                             \
        if (want_quiets) {                                                     \
          EMIT_MOVE(to, MF_QUIET);                                             \
        }                                                                      \
      }                                                                        \
      else if (                                                                \
        want_captures &&                                                       \
        ((target ^ side) & COLOR_BLACK)                                        \
      ) {                                                                      \
        EMIT_MOVE(to, MF_CAPTURE);                                             \
      }                                                                        \
    }                                                                          \
  } while (0)

#define GENERATE_RAY(delta_)                                                   \
  do {                                                                         \
    to = from;                                                                 \
                                                                               \
    while (1) {                                                                \
      to = to + (delta_);                                                      \
                                                                               \
      if (SQUARE_OFFBOARD(to)) {                                               \
        break;                                                                 \
      }                                                                        \
                                                                               \
      target = board[to];                                                      \
                                                                               \
      if (target != PIECE_EMPTY) {                                             \
        if (                                                                   \
          want_captures &&                                                     \
          ((target ^ side) & COLOR_BLACK)                                      \
        ) {                                                                    \
          EMIT_MOVE(to, MF_CAPTURE);                                           \
        }                                                                      \
                                                                               \
        break;                                                                 \
      }                                                                        \
                                                                               \
      if (want_quiets) {                                                       \
        EMIT_MOVE(to, MF_QUIET);                                               \
      }                                                                        \
    }                                                                          \
  } while (0)

  for (index = 0; index < piece_count; ++index) {
    from = piece_list[index];

    switch (PIECE_TYPE(board[from])) {
      case PIECE_PAWN:
        rank = SQUARE_RANK(from);

        if (side == COLOR_WHITE) {
          if (rank == 6) {
            if (want_captures) {
              GENERATE_PAWN_CAPTURE(15, 1);
              GENERATE_PAWN_CAPTURE(17, 1);

              to = from + 16;

              if (board[to] == PIECE_EMPTY) {
                EMIT_PROMOTIONS(to, MF_QUIET);
              }
            }
          } 
          else {
            if (want_captures) {
              GENERATE_PAWN_CAPTURE(15, 0);
              GENERATE_PAWN_CAPTURE(17, 0);
            }

            if (want_quiets) {
              to = from + 16;

              if (
                !SQUARE_OFFBOARD(to) &&
                board[to] == PIECE_EMPTY
              ) {
                EMIT_MOVE(to, MF_QUIET);

                if (rank == 1) {
                  to = from + 32;

                  if (board[to] == PIECE_EMPTY) {
                    EMIT_MOVE(to, MF_DPUSH);
                  }
                }
              }
            }
          }
        } 
        else {
          if (rank == 1) {
            if (want_captures) {
              GENERATE_PAWN_CAPTURE(-17, 1);
              GENERATE_PAWN_CAPTURE(-15, 1);

              to = from - 16;

              if (board[to] == PIECE_EMPTY) {
                EMIT_PROMOTIONS(to, MF_QUIET);
              }
            }
          } 
          else {
            if (want_captures) {
              GENERATE_PAWN_CAPTURE(-17, 0);
              GENERATE_PAWN_CAPTURE(-15, 0);
            }

            if (want_quiets) {
              to = from - 16;

              if (
                !SQUARE_OFFBOARD(to) &&
                board[to] == PIECE_EMPTY
              ) {
                EMIT_MOVE(to, MF_QUIET);

                if (rank == 6) {
                  to = from - 32;

                  if (board[to] == PIECE_EMPTY) {
                    EMIT_MOVE(to, MF_DPUSH);
                  }
                }
              }
            }
          }
        }

        break;

      case PIECE_KNIGHT:
        GENERATE_LEAPER_MOVE(-33);
        GENERATE_LEAPER_MOVE(-31);
        GENERATE_LEAPER_MOVE(-18);
        GENERATE_LEAPER_MOVE(-14);
        GENERATE_LEAPER_MOVE(14);
        GENERATE_LEAPER_MOVE(18);
        GENERATE_LEAPER_MOVE(31);
        GENERATE_LEAPER_MOVE(33);
        break;

      case PIECE_KING:
        GENERATE_LEAPER_MOVE(-17);
        GENERATE_LEAPER_MOVE(-16);
        GENERATE_LEAPER_MOVE(-15);
        GENERATE_LEAPER_MOVE(-1);
        GENERATE_LEAPER_MOVE(1);
        GENERATE_LEAPER_MOVE(15);
        GENERATE_LEAPER_MOVE(16);
        GENERATE_LEAPER_MOVE(17);

        if (want_quiets) {
          if (side == COLOR_WHITE && from == SQUARE(4, 0)) {
            if (
              (POSITION_CASTLING & CASTLE_WHITE_KING) &&
              board[SQUARE(5, 0)] == PIECE_EMPTY &&
              board[SQUARE(6, 0)] == PIECE_EMPTY &&
              board[SQUARE(7, 0)] == WHITE_ROOK
            ) {
              EMIT_MOVE(SQUARE(6, 0), MF_CASTLE);
            }

            if (
              (POSITION_CASTLING & CASTLE_WHITE_QUEEN) &&
              board[SQUARE(3, 0)] == PIECE_EMPTY &&
              board[SQUARE(2, 0)] == PIECE_EMPTY &&
              board[SQUARE(1, 0)] == PIECE_EMPTY &&
              board[SQUARE(0, 0)] == WHITE_ROOK
            ) {
              EMIT_MOVE(SQUARE(2, 0), MF_CASTLE);
            }
          }
          else if (
            side == COLOR_BLACK &&
            from == SQUARE(4, 7)
          ) {
            if (
              (POSITION_CASTLING & CASTLE_BLACK_KING) &&
              board[SQUARE(5, 7)] == PIECE_EMPTY &&
              board[SQUARE(6, 7)] == PIECE_EMPTY &&
              board[SQUARE(7, 7)] == BLACK_ROOK
            ) {
              EMIT_MOVE(SQUARE(6, 7), MF_CASTLE);
            }

            if (
              (POSITION_CASTLING & CASTLE_BLACK_QUEEN) &&
              board[SQUARE(3, 7)] == PIECE_EMPTY &&
              board[SQUARE(2, 7)] == PIECE_EMPTY &&
              board[SQUARE(1, 7)] == PIECE_EMPTY &&
              board[SQUARE(0, 7)] == BLACK_ROOK
            ) {
              EMIT_MOVE(SQUARE(2, 7), MF_CASTLE);
            }
          }
        }

        break;

      case PIECE_BISHOP:
        GENERATE_RAY(15);
        GENERATE_RAY(17);
        GENERATE_RAY(-15);
        GENERATE_RAY(-17);
        break;

      case PIECE_ROOK:
        GENERATE_RAY(1);
        GENERATE_RAY(-1);
        GENERATE_RAY(16);
        GENERATE_RAY(-16);
        break;

      case PIECE_QUEEN:
        GENERATE_RAY(1);
        GENERATE_RAY(-1);
        GENERATE_RAY(16);
        GENERATE_RAY(-16);
        GENERATE_RAY(15);
        GENERATE_RAY(17);
        GENERATE_RAY(-15);
        GENERATE_RAY(-17);
        break;

      default:
        break;
    }
  }

#undef GENERATE_RAY
#undef GENERATE_LEAPER_MOVE
#undef GENERATE_PAWN_CAPTURE
#undef EMIT_PROMOTIONS
#undef EMIT_MOVE

  return generated;
}