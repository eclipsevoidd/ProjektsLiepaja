var _w = display_get_gui_width();
var _h = display_get_gui_height();

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
    draw_text(_w/2, _h/2 + 100, "nospied = turpini ");
}

draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);