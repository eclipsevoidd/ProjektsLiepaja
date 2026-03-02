var _DRIFT = (global.camXOffset * DRIFTSpeed);
final_render_x = x_pos - _DRIFT;

draw_sprite_ext(sprite_index, image_index, final_render_x, anchor_y, 1, 1, 0, c_white, 1);