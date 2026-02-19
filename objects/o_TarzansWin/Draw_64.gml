draw_set_alpha(0.85);
draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

draw_set_halign(fa_center);
draw_set_colour(c_lime);
draw_text(cx, cy - 20, "Malacis!");
draw_set_colour(c_white);
draw_text(cx, cy + 20, "Izgaji tarzanu trasi !!!");
draw_set_colour(c_gray);
draw_text(cx, cy + 70, "Press R to restart");
draw_set_halign(fa_left);