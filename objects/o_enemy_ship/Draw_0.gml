if (flash > 0 && (flash mod 2 == 0)) {
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(s_ship, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.7);
    gpu_set_blendmode(bm_normal);
}
draw_self();

if (hp < 2) {
    draw_set_color(c_red); draw_set_alpha(0.8);
    draw_circle(x, y - 50, 4, false);
    draw_set_alpha(1); draw_set_color(c_white);
}