/// @desc o_BGameManager – DRAW GUI

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _cx = _w / 2;
var _cy = _h / 2;

// === MENU ===
if (global.game_state == "MENU") {
    draw_set_alpha(0.55);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _cy - 130, "BASKETBOLS", 3, 3, 0);
    
    // "Iesildīšanās" — uses s_AboutPoga with text overlay
    // (or make a new sprite s_IesildisanasPoga later)
    draw_sprite_ext(s_AboutPoga, 0, btn_warmup_x, btn_warmup_y, 1, 1, 0, c_white, btn_warmup_alpha);
    draw_set_color(c_white);
    draw_text_transformed(btn_warmup_x, btn_warmup_y, "Iesildīšanās", 1.5, 1.5, 0);
    
    // "Sākt Spēli"
    draw_sprite_ext(s_StartPoga, 0, btn_start_x, btn_start_y, 1, 1, 0, c_white, btn_start_alpha);
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    exit;
}

// === PRACTICE ===
if (global.game_state == "PRACTICE") {
    // Rēķina pozīciju katru kadru, nevis no Create
    var _go_x = _w - 250;
    var _go_y = 70;
    
    draw_sprite_ext(s_StartPoga, 0, _go_x, _go_y, 0.8, 0.8, 0, c_white, btn_go_alpha);
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    draw_set_color(c_aqua);
    draw_text(20, 20, "IESILDĪŠANĀS");
    draw_set_color(c_white);
    draw_text(20, 50, "E - Mest");
    draw_text(20, 70, "Q - Driblēt");
    exit;
}

// === MATCH HUD (PLAYING / COUNTDOWN / MINIGAME / POST_SCORE) ===
if (global.game_state == "PLAYING" || global.game_state == "COUNTDOWN" || 
    global.game_state == "MINIGAME" || global.game_state == "POST_SCORE") {
    
    // Score panel
    draw_set_alpha(0.6); draw_set_color(c_black);
    draw_roundrect(_cx - 200, 8, _cx + 200, 80, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center); draw_set_valign(fa_top);
    
    draw_set_color(make_color_rgb(100, 180, 255));
    draw_text_transformed(_cx - 80, 12, string(global.player_score), 2.5, 2.5, 0);
    draw_set_color(c_ltgray);
    draw_text(_cx - 80, 58, "TU");
    
    draw_set_color(c_white);
    draw_text_transformed(_cx, 15, ":", 2.5, 2.5, 0);
    
    draw_set_color(make_color_rgb(255, 100, 100));
    draw_text_transformed(_cx + 80, 12, string(global.enemy_score), 2.5, 2.5, 0);
    draw_set_color(c_ltgray);
    draw_text(_cx + 80, 58, "PRETINIEKS");
    
    draw_set_color(c_gray);
    draw_text(_cx, 82, "Līdz " + string(global.target_score));
    
    // Progress bar
    var _bw = 380; var _bx = _cx - _bw / 2; var _by = 98;
    draw_set_color(make_color_rgb(30, 30, 50));
    draw_rectangle(_bx, _by, _bx + _bw, _by + 6, false);
    
    var _pf = min(1, global.player_score / global.target_score) * (_bw / 2);
    draw_set_color(make_color_rgb(100, 180, 255));
    draw_rectangle(_cx - _pf, _by, _cx, _by + 6, false);
    
    var _ef = min(1, global.enemy_score / global.target_score) * (_bw / 2);
    draw_set_color(make_color_rgb(255, 100, 100));
    draw_rectangle(_cx, _by, _cx + _ef, _by + 6, false);
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_text(20, 20, "E - Mest  |  Q - Driblēt  |  F - Nozagt");
}

// === COUNTDOWN ===
if (global.game_state == "COUNTDOWN") {
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    var _num = clamp(ceil(global.countdown / 40), 1, 3);
    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _cy, string(_num), 5, 5, 0);
}

// === TIP-OFF ===
if (global.game_state == "MINIGAME") {
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_set_alpha(0.5); draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);

    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _cy - 50, "BUMBAS UZMETIENS!", 2, 2, 0);
    draw_set_color(c_white);
    draw_text_transformed(_cx, _cy, "NOSPIED: " + global.mini_key, 4, 4, 0);
    
    var _tw = (global.mini_timer / 60) * 200;
    draw_set_color(c_aqua);
    draw_rectangle(_cx - 100, _cy + 60, _cx - 100 + _tw, _cy + 80, false);
}

// === POST SCORE ===
if (global.game_state == "POST_SCORE") {
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_set_color(c_orange);
    var _sc = 2 + sin(current_time / 100) * 0.2;
    draw_text_transformed(_cx, _cy, "+" + string(global.points_per_basket) + " Punkti!", _sc, _sc, 0);
}

// === GAME OVER ===
if (global.game_state == "GAME_OVER") {
    draw_set_alpha(0.8); draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    
    if (global.match_winner == "PLAYER") {
        draw_set_color(c_yellow);
        draw_text_transformed(_cx, _cy - 80, "TU UZVARĒJI!", 3, 3, 0);
    } else {
        draw_set_color(c_red);
        draw_text_transformed(_cx, _cy - 80, "TU ZAUDĒJI!", 3, 3, 0);
    }
    
    draw_set_color(make_color_rgb(100, 180, 255));
    draw_text_transformed(_cx - 80, _cy, string(global.player_score), 2.5, 2.5, 0);
    draw_set_color(c_white);
    draw_text_transformed(_cx, _cy, ":", 2.5, 2.5, 0);
    draw_set_color(make_color_rgb(255, 100, 100));
    draw_text_transformed(_cx + 80, _cy, string(global.enemy_score), 2.5, 2.5, 0);
    
    draw_set_color(c_gray);
    draw_text(_cx, _cy + 80, "Nospied ENTER lai turpinātu");
}

draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_set_color(c_white); draw_set_alpha(1);