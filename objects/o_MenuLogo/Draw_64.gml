var _current_gui_x = lerp(start_x, anchor_x, global.uiEaseProgress);

var _final_x = _current_gui_x - (global.camXOffset * KONCERTZALESpeed);

draw_sprite_ext(sprite_index, 0, _final_x, anchor_y, 0.75, 0.75, 0, c_white, 1);