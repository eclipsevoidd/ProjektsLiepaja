draw_set_alpha(0.85);
draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;
var _deaths = 0;
if (instance_exists(o_TarzanManager)) _deaths = o_TarzanManager.death_count;

var _score = max(0, 100 - _deaths * 10);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_colour(c_lime);
draw_text_transformed(cx, cy - 80, "Malacis!", 2.5, 2.5, 0);

draw_set_colour(c_white);
draw_text_transformed(cx, cy - 30, "Tarzāna trase pabeigta!", 1.5, 1.5, 0);

// Nāves
draw_set_colour(_deaths > 0 ? c_red : c_lime);
draw_text(cx, cy + 20, "Nāves: " + string(_deaths));

// Punkti
draw_set_colour(c_yellow);
draw_text_transformed(cx, cy + 60, "PUNKTI: " + string(_score) + " / 100", 2, 2, 0);

draw_set_colour(c_gray);
draw_text(cx, cy + 110, "Nospied ENTER lai turpinātu");

draw_set_halign(fa_left);
draw_set_valign(fa_top);