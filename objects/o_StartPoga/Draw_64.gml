var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _current_gui_x = lerp(start_x, current_x, global.uiEaseProgress);
var _current_gui_y = current_y;
var _final_x = _current_gui_x - (global.camXOffset * driftSpeed);

if (point_in_rectangle(_mx, _my, _final_x - (sprite_width/2), 
    _current_gui_y - (sprite_height/2), _final_x + (sprite_width/2), 
    _current_gui_y + (sprite_height/2))) {
        
    ui_alpha = lerp(ui_alpha, 1.0, 0.1);
} else {
    ui_alpha = lerp(ui_alpha, 0.5, 0.1);
}

draw_sprite_ext(sprite_index, 0, _final_x, _current_gui_y, 1, 1, 0, c_white, ui_alpha);