/**
 * @file game.c
 *
 * Implementation of game.h
 */

#include <graphx.h>
#include <stdint.h>
#include <ti/getcsc.h>

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
#include "gfx/gfx.h"
#include "memory_map.h"

enum {
  SCREEN_FOREGROUND = 252,
  SCREEN_LIGHT_SQUARE = 253,
  SCREEN_DARK_SQUARE = 254,
  SCREEN_BACKGROUND = 255,

  BOARD_X = 24,
  BOARD_Y = 8,
  BOARD_CELL_SIZE = 24,

  SIDE_X = 224,
  SIDE_CLEAR_X = 220,
  SIDE_WIDTH = 100
};

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

void game_init_graphics(void)
{
  static const uint16_t interface_palette[] = {
    gfx_RGBTo1555(0x16, 0x18, 0x1D),
    gfx_RGBTo1555(0xC9, 0xC4, 0xA5),
    gfx_RGBTo1555(0x72, 0x7A, 0x63),
    gfx_RGBTo1555(0xFF, 0xFF, 0xFF)
  };

  gfx_SetPalette(
    sprite_palette,
    sizeof_sprite_palette,
    0
  );

  gfx_SetPalette(
    interface_palette,
    sizeof(interface_palette),
    SCREEN_FOREGROUND
  );

  gfx_SetTransparentColor(0);

  gfx_SetTextFGColor(SCREEN_FOREGROUND);
  gfx_SetTextBGColor(SCREEN_BACKGROUND);
  gfx_SetTextTransparentColor(SCREEN_BACKGROUND);
}

static uint8_t wait_key(void)
{
  uint8_t key;

  while (!(key = os_GetCSC())) {
  }

  while (os_GetCSC()) {
  }

  return key;
}

static const gfx_sprite_t *piece_sprite(uint8_t piece)
{
  uint8_t black =
    PIECE_COLOR(piece) == COLOR_BLACK;

  switch (PIECE_TYPE(piece)) {
    case PIECE_PAWN:
      return black ? pawn_24_b : pawn_24_w;

    case PIECE_KNIGHT:
      return black ? knight_24_b : knight_24_w;

    case PIECE_KING:
      return black ? king_24_b : king_24_w;

    case PIECE_BISHOP:
      return black ? bishop_24_b : bishop_24_w;

    case PIECE_ROOK:
      return black ? rook_24_b : rook_24_w;

    case PIECE_QUEEN:
      return black ? queen_24_b : queen_24_w;

    default:
      return 0;
  }
}

static void clear_side(void)
{
  gfx_SetColor(SCREEN_BACKGROUND);
  gfx_FillRectangle(
    SIDE_CLEAR_X,
    0,
    SIDE_WIDTH,
    GFX_LCD_HEIGHT
  );
}

static void draw_board(uint8_t player_side)
{
  gfx_FillScreen(SCREEN_BACKGROUND);
  gfx_SetTextScale(1, 1);
  gfx_SetTextFGColor(SCREEN_FOREGROUND);

  for (uint8_t row = 0; row < 8; ++row) {
    uint8_t rank = player_side == COLOR_WHITE
      ? 7 - row
      : row;

    gfx_SetTextXY(
      8,
      BOARD_Y + row * BOARD_CELL_SIZE + 8
    );
    gfx_PrintChar('1' + rank);
  }

  for (uint8_t column = 0; column < 8; ++column) {
    uint8_t file = player_side == COLOR_WHITE
      ? column
      : 7 - column;

    gfx_SetTextXY(
      BOARD_X + column * BOARD_CELL_SIZE + 8,
      BOARD_Y + 8 * BOARD_CELL_SIZE + 8
    );
    gfx_PrintChar('a' + file);
  }

  for (uint8_t row = 0; row < 8; ++row) {
    uint8_t rank = player_side == COLOR_WHITE
      ? 7 - row
      : row;

    for (uint8_t column = 0; column < 8; ++column) {
      uint8_t file = player_side == COLOR_WHITE
        ? column
        : 7 - column;
      uint8_t square = SQUARE(file, rank);
      uint8_t piece = BOARD[square];
      uint24_t x =
        BOARD_X + column * BOARD_CELL_SIZE;
      uint8_t y =
        BOARD_Y + row * BOARD_CELL_SIZE;

      gfx_SetColor(
        ((file + rank) & 1)
          ? SCREEN_LIGHT_SQUARE
          : SCREEN_DARK_SQUARE
      );
      gfx_FillRectangle_NoClip(
        x,
        y,
        BOARD_CELL_SIZE,
        BOARD_CELL_SIZE
      );

      if (piece != PIECE_EMPTY) {
        gfx_TransparentSprite_NoClip(
          piece_sprite(piece),
          x,
          y
        );
      }
    }
  }
}

static void draw_input(
  const char input[5],
  uint8_t length,
  uint8_t slots
)
{
  gfx_SetColor(SCREEN_BACKGROUND);
  gfx_FillRectangle(SIDE_X, 104, 48, 10);

  gfx_SetTextXY(SIDE_X, 104);

  for (uint8_t index = 0; index < slots; ++index) {
    gfx_PrintChar(index < length ? input[index] : '_');
  }
}

static void draw_player_prompt(
  uint8_t illegal,
  uint8_t promotion,
  const char input[5],
  uint8_t length
)
{
  clear_side();

  gfx_PrintStringXY("MinTI", SIDE_X + 24, 16);

  if (illegal) {
    gfx_PrintStringXY("Illegal move", SIDE_X, 48);
  }
  else if (promotion) {
    gfx_PrintStringXY("Promotion", SIDE_X, 48);
  }
  else {
    gfx_PrintStringXY("Your move", SIDE_X, 48);
  }

  gfx_PrintStringXY(
    promotion ? "pick q/r/b/n" : "e.g. e2e4",
    SIDE_X,
    72
  );
  gfx_PrintStringXY("Move:", SIDE_X, 88);
  gfx_PrintStringXY("CLEAR exits", SIDE_X, 136);

  draw_input(input, length, promotion ? 5 : 4);
}

static void draw_thinking(uint8_t player_side)
{
  draw_board(player_side);
  clear_side();

  gfx_PrintStringXY("MinTI", SIDE_X + 24, 16);
  gfx_PrintStringXY("Thinking...", SIDE_X, 56);
}

static char file_from_key(uint8_t key)
{
  switch (key) {
    case sk_Math:
      return 'a';

    case sk_Apps:
      return 'b';

    case sk_Prgm:
      return 'c';

    case sk_Recip:
      return 'd';

    case sk_Sin:
      return 'e';

    case sk_Cos:
      return 'f';

    case sk_Tan:
      return 'g';

    case sk_Power:
      return 'h';

    default:
      return 0;
  }
}

static char rank_from_key(uint8_t key)
{
  switch (key) {
    case sk_1:
      return '1';

    case sk_2:
      return '2';

    case sk_3:
      return '3';

    case sk_4:
      return '4';

    case sk_5:
      return '5';

    case sk_6:
      return '6';

    case sk_7:
      return '7';

    case sk_8:
      return '8';

    default:
      return 0;
  }
}

static char promotion_from_key(
  uint8_t key,
  uint8_t *promotion_flags
)
{
  switch (key) {
    case sk_9:
      *promotion_flags = MF_PROMO_QUEEN;
      return 'q';

    case sk_Mul:
      *promotion_flags = MF_PROMO_ROOK;
      return 'r';

    case sk_Apps:
      *promotion_flags = MF_PROMO_BISHOP;
      return 'b';

    case sk_Log:
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
  char input[5];
  uint8_t illegal = 0;

  while (1) {
    uint8_t length = 0;
    uint8_t promotion_pending = 0;

    draw_board(player_side);
    draw_player_prompt(
      illegal,
      promotion_pending,
      input,
      length
    );

    while (1) {
      uint8_t key = wait_key();

      if (key == sk_Clear) {
        return INPUT_EXIT;
      }

      if (key == sk_Del) {
        if (promotion_pending) {
          length = 3;
          promotion_pending = 0;
          illegal = 0;

          draw_player_prompt(
            illegal,
            promotion_pending,
            input,
            length
          );
        }
        else if (length != 0) {
          --length;
          draw_input(input, length, 4);
        }

        continue;
      }

      if (promotion_pending) {
        // default = queen promotion
        if (key == sk_Enter) {
          return INPUT_MOVE;
        }

        uint8_t promotion_flags;
        char character = promotion_from_key(
          key,
          &promotion_flags
        );

        if (!character) {
          continue;
        }

        input[4] = character;
        draw_input(input, 5, 5);

        move->flags |= promotion_flags;

        return INPUT_MOVE;
      }

      char character = (length & 1)
        ? rank_from_key(key)
        : file_from_key(key);

      if (!character) {
        continue;
      }

      input[length++] = character;
      draw_input(input, length, 4);

      if (length < 4) {
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
        break;
      }

      if (!(move->flags & MF_PROMO)) {
        return INPUT_MOVE;
      }

      promotion_pending = 1;
      draw_player_prompt(
        0,
        promotion_pending,
        input,
        length
      );
    }
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
  clear_side();

  switch (result) {
    case GAME_WHITE_WINS:
      gfx_PrintStringXY("White wins", SIDE_X, 24);
      gfx_PrintStringXY("Checkmate", SIDE_X, 48);
      break;

    case GAME_BLACK_WINS:
      gfx_PrintStringXY("Black wins", SIDE_X, 24);
      gfx_PrintStringXY("Checkmate", SIDE_X, 48);
      break;

    case GAME_STALEMATE:
      gfx_PrintStringXY("Draw", SIDE_X, 24);
      gfx_PrintStringXY("Stalemate", SIDE_X, 48);
      break;

    case GAME_REPETITION:
      gfx_PrintStringXY("Draw", SIDE_X, 24);
      gfx_PrintStringXY("Repetition", SIDE_X, 48);
      break;

    case GAME_FIFTY_MOVE:
      gfx_PrintStringXY("Draw", SIDE_X, 24);
      gfx_PrintStringXY("50-move rule", SIDE_X, 48);
      break;

    case GAME_INSUFFICIENT_MATERIAL:
      gfx_PrintStringXY("Draw", SIDE_X, 24);
      gfx_PrintStringXY("Insufficient", SIDE_X, 48);
      gfx_PrintStringXY("material", SIDE_X, 72);
      break;

    default:
      gfx_PrintStringXY("Engine error", SIDE_X, 24);
      break;
  }

  gfx_PrintStringXY("Press a key", SIDE_X, 104);
  wait_key();
}

static uint8_t choose_option(
  const char *title,
  const char *first,
  const char *second
)
{
  gfx_FillScreen(SCREEN_BACKGROUND);
  gfx_SetTextScale(2, 2);
  gfx_PrintStringXY("MinTI", 120, 32);

  gfx_SetTextScale(1, 1);
  gfx_PrintStringXY(title, 72, 88);
  gfx_PrintStringXY(first, 88, 120);
  gfx_PrintStringXY(second, 88, 144);
  gfx_PrintStringXY("CLEAR: Exit", 88, 184);

  while (1) {
    uint8_t key = wait_key();

    if (key == sk_1) {
      return 1;
    }

    if (key == sk_2) {
      return 2;
    }

    if (key == sk_Clear) {
      return 0;
    }
  }
}

uint8_t game_run(void)
{
  uint8_t color_choice = choose_option(
    "Choose your color",
    "1: White",
    "2: Black"
  );

  if (!color_choice) {
    return 0;
  }

  uint8_t mode_choice = choose_option(
    "Choose a mode",
    "1: Fast",
    "2: Normal"
  );

  if (!mode_choice) {
    return 0;
  }

  uint8_t player_side = color_choice == 1
    ? COLOR_WHITE
    : COLOR_BLACK;
  uint24_t time_budget = mode_choice == 1
    ? 2
    : 4;

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
          MAX_PLY,
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
  }

  show_game_result(player_side, result);
  return result == GAME_ERROR;
}
