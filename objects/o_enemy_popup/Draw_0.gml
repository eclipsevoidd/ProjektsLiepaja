var _dy = y + current_offset;

if (hit) {
    draw_sprite_ext(s_popup_soldier, 0, x, _dy, 1, 1, 0, c_red, 0.7);
} else {
    draw_sprite_ext(s_popup_soldier, 0, x, _dy, 1, 1, 0, c_white, 1);
    if (phase == 1) {
        draw_set_color(c_red); draw_set_halign(fa_center); draw_set_valign(fa_bottom);
        draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);
    }
}