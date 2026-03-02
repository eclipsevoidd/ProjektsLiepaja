draw_set_font(f_FranklinGothicLarge);
draw_set_halign(fa_center);
draw_set_color(c_white);

var _title_x = display_get_gui_width() / 2;
var _start_y = 200;
var _row_h = 60;

draw_text(_title_x, 100, "TOP 10");

for (var i = 0; i < array_length(global.leaderboard); i++) {
    var _entry = global.leaderboard[i];
    var _name = _entry.name;
    var _time = scr_format_time(_entry.time);
    var _score = string(_entry.p_score);
    var _text = string(i + 1) + ".  " + _name + "     " + _time + "     " + _score + " punkti";
    draw_text(_title_x, _start_y + i * _row_h, _text);
}

draw_set_halign(fa_left);