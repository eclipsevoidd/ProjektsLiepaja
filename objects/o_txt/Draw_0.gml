draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_color(col); draw_set_alpha(life / life_max);
draw_text_transformed(x, y, text, 1.4, 1.4, 0);
draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);