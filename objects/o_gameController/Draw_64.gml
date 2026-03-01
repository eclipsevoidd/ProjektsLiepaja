draw_set_font(f_FranklinGothicMedium);

var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _w = display_get_gui_width();
var _h = display_get_gui_height();

// === MENU ===
if (state == GS.MENU) {
    draw_set_alpha(0.55);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text_transformed(_w / 2, _h / 2 - 100, "ZIEMEĻU FORTI", 3, 3, 0);
    
    draw_set_color(c_gray);
    draw_text(_w / 2, _h / 2 - 50, "Aizstāvi fortu no iebrucējiem!");
    
    var _btn_x = _w / 2;
    var _btn_y = _h / 2 + 30;
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _over = point_in_rectangle(_mx, _my, _btn_x - btn_hw, _btn_y - btn_hh, _btn_x + btn_hw, _btn_y + btn_hh);
    btn_alpha = lerp(btn_alpha, _over ? 1.0 : 0.6, 0.12);
    
    draw_sprite_ext(s_StartPoga, 0, _btn_x, _btn_y, 1, 1, 0, c_white, btn_alpha);
    
    if (mouse_check_button_pressed(mb_left) && _over) {
        state = GS.INTRO;
        window_set_cursor(cr_none);
        instance_create_layer(0, 0, "Instances", o_fps_gun);
        instance_create_layer(0, 0, "Instances", o_crosshair);
    }
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    draw_set_color(c_white); draw_set_alpha(1);
    exit;
}

// Score (top-right)
draw_set_alpha(0.55); draw_set_color(c_black);
draw_roundrect(_w - 320, 12, _w - 25, 80, false);
draw_set_alpha(1); draw_set_halign(fa_right); draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(_w - 45, 18, string(score_val), 2.2, 2.2, 0);
draw_set_color(c_ltgray);
draw_text(_w - 45, 60, "SCORE");

// Timer (top-center)
if (state == GS.PLAYING || state == GS.INTRO) {
    var _secs = ceil(game_time / 60);
    var _mins = _secs div 60;
    var _ss = _secs mod 60;
    var _ts = string(_mins) + ":" + ((_ss < 10) ? "0" : "") + string(_ss);

    draw_set_halign(fa_center); draw_set_valign(fa_top);
    draw_set_alpha(0.55); draw_set_color(c_black);
    draw_roundrect(_w/2 - 80, 12, _w/2 + 80, 65, false);
    draw_set_alpha(1);
    draw_set_color((_secs <= 10 && state == GS.PLAYING) ? c_red : c_white);
    draw_text_transformed(_w/2, 15, _ts, 2.2, 2.2, 0);

    // Time bar
    var _pct = game_time / 3600;
    draw_set_alpha(0.4); draw_set_color(c_black);
    draw_rectangle(_w/2 - 100, 68, _w/2 + 100, 76, false);
    draw_set_alpha(0.85); draw_set_color(merge_color(c_red, c_aqua, _pct));
    draw_rectangle(_w/2 - 100, 68, _w/2 - 100 + (200 * _pct), 76, false);
}


// Results
if (state == GS.RESULTS) {
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_set_color(c_black); draw_set_alpha(0.75);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);

    draw_set_color(c_yellow);
    draw_text_transformed(_w/2, _h/2 - 130, "Laiks beidzas!", 3, 3, 0);
    draw_set_color(c_white);
    draw_text_transformed(_w/2, _h/2 - 50, "Punkti: " + string(score_val), 2, 2, 0);

    draw_set_color(c_gray);
    draw_text(_w/2, _h/2 + 100, "Nospied, lai beigtu spēli");
}

draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);