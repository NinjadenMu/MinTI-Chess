/**
 * @file game.c
 *
 * Implementation of game.h
 */

#include <stdint.h>
#include <stdio.h>

#include "../config.h"
#include "../engine/attack.h"
#include "../engine/legality.h"
#include "../engine/make_move.h"
#include "../engine/movegen.h"
#include "../engine/repetition.h"
#include "../engine/search.h"
#include "../engine/storage.h"
#include "../engine/types.h"
#include "game.h"
#include "memory_map.h"

enum {
  GAME_CONTINUES,
  GAME_WHITE_WINS,
  GAME_BLACK_WINS,
  GAME_STALEMATE,
  GAME_REPETITION,
  GAME_FIFTY_MOVE,
  GAME_INSUFFICIENT_MATERIAL,
  GAME_ERROR
};

enum {
  INPUT_MOVE,
  INPUT_EXIT,
  INPUT_ERROR
};

enum {
  MOVE_INVALID,
  MOVE_VALID,
  MOVE_ERROR
};

static char piece_character(uint8_t piece)
{
  char character;

  switch (PIECE_TYPE(piece)) {
    case PIECE_EMPTY:
      return '.';

    case PIECE_PAWN:
      character = 'P';
      break;

    case PIECE_KNIGHT:
      character = 'N';
      break;

    case PIECE_KING:
      character = 'K';
      break;

    case PIECE_BISHOP:
      character = 'B';
      break;

    case PIECE_ROOK:
      character = 'R';
      break;

    case PIECE_QUEEN:
      character = 'Q';
      break;

    default:
      return '?';
  }

  if (PIECE_COLOR(piece) == COLOR_BLACK) {
    character += 'a' - 'A';
  }

  return character;
}

static void draw_board(uint8_t player_side)
{
  puts("");

  for (uint8_t row = 0; row < 8; ++row) {
    uint8_t rank = player_side == COLOR_WHITE
      ? 7 - row
      : row;

    printf("%d ", rank + 1);

    for (uint8_t column = 0; column < 8; ++column) {
      uint8_t file = player_side == COLOR_WHITE
        ? column
        : 7 - column;
      uint8_t square = SQUARE(file, rank);

      printf(" %c", piece_character(BOARD[square]));
    }

    puts("");
  }

  printf("  ");

  for (uint8_t column = 0; column < 8; ++column) {
    uint8_t file = player_side == COLOR_WHITE
      ? column
      : 7 - column;

    printf(" %c", 'a' + file);
  }

  puts("\n");
}

static void draw_player_prompt(uint8_t illegal)
{
  if (illegal) {
    puts("Illegal move");
  }
  else {
    puts("Your move");
  }

  puts("Enter a move in UCI format (e.g. e2e4)");
  puts("Add q, r, b, or n for promotion type");
  puts("Entering just q exits");
  printf("> ");
}

static void draw_thinking(uint8_t player_side)
{
  draw_board(player_side);
  puts("Thinking...");
}

static char promotion_from_character(
  char character,
  uint8_t *promotion_flags
)
{
  switch (character) {
    case 'q':
      *promotion_flags = MF_PROMO_QUEEN;
      return 'q';

    case 'r':
      *promotion_flags = MF_PROMO_ROOK;
      return 'r';

    case 'b':
      *promotion_flags = MF_PROMO_BISHOP;
      return 'b';

    case 'n':
      *promotion_flags = MF_PROMO_KNIGHT;
      return 'n';

    default:
      return 0;
  }
}

static uint8_t match_legal_move(
  uint8_t from,
  uint8_t to,
  move_t *matched_move
)
{
  uint8_t count = movegen_generate(
    move_arena,
    MOVEGEN_OVERFLOW - 1,
    GEN_ALL
  );

  if (count == MOVEGEN_OVERFLOW) {
    return MOVE_ERROR;
  }

  king_info_t *king_info = &king_info_stack[0];
  king_scan(POSITION_SIDE, king_info);

  for (uint8_t index = 0; index < count; ++index) {
    move_t *candidate = &move_arena[index];

    if (
      candidate->from == from &&
      candidate->to == to &&
      move_is_legal(candidate, king_info)
    ) {
      *matched_move = *candidate;
      return MOVE_VALID;
    }
  }

  return MOVE_INVALID;
}

static uint8_t read_player_move(
  uint8_t player_side,
  move_t *move
)
{
  char input[16];
  uint8_t illegal = 0;

  while (1) {
    draw_board(player_side);
    draw_player_prompt(illegal);
    fflush(stdout);

    if (!fgets(input, sizeof(input), stdin)) {
      return INPUT_EXIT;
    }

    if (input[0] == 'q') {
      return INPUT_EXIT;
    }

    if (
      input[0] < 'a' ||
      input[0] > 'h' ||
      input[1] < '1' ||
      input[1] > '8' ||
      input[2] < 'a' ||
      input[2] > 'h' ||
      input[3] < '1' ||
      input[3] > '8'
    ) {
      illegal = 1;
      continue;
    }

    uint8_t from = SQUARE(
      input[0] - 'a',
      input[1] - '1'
    );
    uint8_t to = SQUARE(
      input[2] - 'a',
      input[3] - '1'
    );

    uint8_t status = match_legal_move(
      from,
      to,
      move
    );

    if (status == MOVE_ERROR) {
      return INPUT_ERROR;
    }

    if (status == MOVE_INVALID) {
      illegal = 1;
      continue;
    }

    if (!(move->flags & MF_PROMO)) {
      return INPUT_MOVE;
    }

    if (input[4] == '\n' || input[4] == '\0') {
      return INPUT_MOVE;
    }

    uint8_t promotion_flags;

    if (
      !promotion_from_character(
        input[4],
        &promotion_flags
      )
    ) {
      illegal = 1;
      continue;
    }

    move->flags |= promotion_flags;
    return INPUT_MOVE;
  }
}

static uint8_t has_insufficient_material(void)
{
  uint8_t knights = 0;

  uint8_t bishop_square_color = 2;

  for (
    uint8_t color_index = 0;
    color_index < 2;
    ++color_index
  ) {
    uint8_t count = PIECE_COUNT[color_index];

    for (uint8_t index = 0; index < count; ++index) {
      uint8_t square = PIECE_LIST[color_index][index];
      uint8_t type = PIECE_TYPE(BOARD[square]);

      switch (type) {
        case PIECE_KING:
          break;

        case PIECE_KNIGHT:
          ++knights;
          if (knights > 1) {
            return 0;
          }

          break;

        case PIECE_BISHOP:
          {
            uint8_t square_color =
              (SQUARE_FILE(square) + SQUARE_RANK(square)) & 1;

            if (
              bishop_square_color != 2 &&
              bishop_square_color != square_color
            ) {
              return 0;
            }

            bishop_square_color = square_color;
          }

          break;

        default:
          return 0;
      }
    }
  }

  return
    knights == 0 ||
    (
      knights == 1 &&
      bishop_square_color == 2
    );
}

static uint8_t current_game_result(
  uint8_t repeated
)
{
  uint8_t count = movegen_generate(
    move_arena,
    MOVEGEN_OVERFLOW - 1,
    GEN_ALL
  );

  if (count == MOVEGEN_OVERFLOW) {
    return GAME_ERROR;
  }

  king_info_t *king_info = &king_info_stack[0];
  king_scan(POSITION_SIDE, king_info);

  for (uint8_t index = 0; index < count; ++index) {
    if (move_is_legal(&move_arena[index], king_info)) {
      if (has_insufficient_material()) {
        return GAME_INSUFFICIENT_MATERIAL;
      }

      if (POSITION_HALFMOVE >= 100) {
        return GAME_FIFTY_MOVE;
      }

      if (repeated) {
        return GAME_REPETITION;
      }

      return GAME_CONTINUES;
    }
  }

  if (king_info->n_checkers == 0) {
    return GAME_STALEMATE;
  }

  return POSITION_SIDE == COLOR_WHITE
    ? GAME_BLACK_WINS
    : GAME_WHITE_WINS;
}

static void show_game_result(
  uint8_t player_side,
  uint8_t result
)
{
  draw_board(player_side);

  switch (result) {
    case GAME_WHITE_WINS:
      puts("White wins");
      puts("Checkmate");
      break;

    case GAME_BLACK_WINS:
      puts("Black wins");
      puts("Checkmate");
      break;

    case GAME_STALEMATE:
      puts("Draw");
      puts("Stalemate");
      break;

    case GAME_REPETITION:
      puts("Draw");
      puts("Repetition");
      break;

    case GAME_FIFTY_MOVE:
      puts("Draw");
      puts("50-move rule");
      break;

    case GAME_INSUFFICIENT_MATERIAL:
      puts("Draw");
      puts("Insufficient material");
      break;

    default:
      puts("Engine error");
      break;
  }
}

static uint8_t choose_color(void)
{
  char input[16];

  puts("MinTI\n");
  puts("Choose your color");
  puts("1: White");
  puts("2: Black");
  puts("q: Exit");

  while (1) {
    printf("> ");
    fflush(stdout);

    if (!fgets(input, sizeof(input), stdin)) {
      return 0;
    }

    if (input[0] == '1') {
      return 1;
    }

    if (input[0] == '2') {
      return 2;
    }

    if (input[0] == 'q') {
      return 0;
    }
  }
}

static uint8_t choose_strength(void)
{
  char input[16];

  puts("");
  puts("Choose engine strength");
  puts("1: Simulate Calculator");
  puts("2: Fast Local");
  puts("3: Normal Local");
  puts("q: Exit");

  while (1) {
    printf("> ");
    fflush(stdout);

    if (!fgets(input, sizeof(input), stdin)) {
      return 0;
    }

    if (input[0] == '1') {
      return 1;
    }

    if (input[0] == '2') {
      return 2;
    }

    if (input[0] == '3') {
      return 3;
    }

    if (input[0] == 'q') {
      return 0;
    }
  }
}

uint8_t game_run(void)
{
  uint8_t color_choice = choose_color();

  if (!color_choice) {
    return 0;
  }

  uint8_t strength_choice = choose_strength();

  if (!strength_choice) {
    return 0;
  }

  uint8_t player_side = color_choice == 1
    ? COLOR_WHITE
    : COLOR_BLACK;
  uint8_t max_depth = strength_choice == 1
    ? 5
    : MAX_PLY;
  uint24_t time_budget = strength_choice == 2
    ? 1
    : strength_choice == 3
      ? 3
      : 0;

  repetition_game_reset();

  uint8_t repeated = 0;
  uint8_t result = GAME_CONTINUES;

  while (
    (result = current_game_result(repeated)) ==
    GAME_CONTINUES
  ) {
    move_t move;

    if (POSITION_SIDE == player_side) {
      uint8_t input_status = read_player_move(
        player_side,
        &move
      );

      if (input_status == INPUT_EXIT) {
        return 0;
      }

      if (input_status == INPUT_ERROR) {
        result = GAME_ERROR;
        break;
      }
    }
    else {
      search_result_t search_result;

      draw_thinking(player_side);

      if (
        search_position(
          max_depth,
          &search_result,
          time_budget
        ) ||
        !search_result.has_move
      ) {
        result = GAME_ERROR;
        break;
      }

      move = search_result.best_move;
    }

    make_move(&move, &undo_stack[0]);
    repeated = repetition_game_push();

    fflush(stdout);
  }

  show_game_result(player_side, result);
  return result == GAME_ERROR;
}
