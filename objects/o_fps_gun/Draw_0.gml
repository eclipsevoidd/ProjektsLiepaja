var _gx = gun_x;
var _gy = gun_y + recoil;

// Muzzle flash (fixed position, at barrel tip)
if (flash_timer > 0) {
    var _fy = flash_y + recoil;
    draw_set_color(c_yellow); draw_set_alpha(flash_timer / 5);
    draw_circle(flash_x, _fy, 20 + irandom(8), false);
    draw_set_color(c_white); draw_set_alpha(flash_timer / 5 * 0.8);
    draw_circle(flash_x, _fy, 10, false);
    draw_set_alpha(1);
}

// Gun
draw_sprite_ext(s_musket, 0, _gx, _gy, 1, 1, 0, c_white, 1);