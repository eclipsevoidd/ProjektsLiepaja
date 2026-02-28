draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(global.textColor);

draw_text_transformed(o_QuestionPanel.x, 60, "Kopējie punkti: " + string(global.punkti), 0.5, 0.5, 0);

draw_set_color(c_white);