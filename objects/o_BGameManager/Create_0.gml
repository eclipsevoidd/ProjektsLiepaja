/// @desc o_BGameManager – CREATE

global.game_state = "MENU";

// Match scoring
global.player_score = 0;
global.enemy_score  = 0;
global.target_score = 100;
global.points_per_basket = 10;

// Tip-off
global.mini_key    = "";
global.mini_timer  = 0;
global.countdown   = 0;
global.score_delay = 0;

// Result
global.match_winner = "";

// Button positions (GUI coords, drawn centered)
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

btn_warmup_x = _gui_w / 2;
btn_warmup_y = _gui_h / 2 - 30;

btn_start_x = _gui_w / 2;
btn_start_y = _gui_h / 2 + 100;

// "Sākt Spēli" during practice (top-right)
btn_go_x = _gui_w - 230;
btn_go_y = 70;

// Hover alphas
btn_warmup_alpha = 0.6;
btn_start_alpha  = 0.6;
btn_go_alpha     = 0.6;

// Half-dimensions for click detection (s_StartPoga = 417x114)
btn_hw = 208;
btn_hh = 57;