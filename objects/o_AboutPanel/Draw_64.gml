var _drift = (global.camXOffset * driftSpeed);
final_render_x = x_pos - _drift;

draw_sprite_ext(sprite_index, image_index, final_render_x, anchor_y, 1, 1, 0, c_white, 1);