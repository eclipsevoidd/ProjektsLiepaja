if (instance_exists(o_AboutPanel)) {
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    
    var _base_x = o_AboutPanel.x_pos - (global.camXOffset * DRIFTSpeed);
    var _base_y = o_AboutPanel.anchor_y;

    var _final_x = _base_x + offset_x;
    var _final_y = _base_y + offset_y;
    
    var _hw = sprite_width / 2;
    var _hh = sprite_height / 2;

    var _hovering = point_in_rectangle(_mx, _my, _final_x - _hw, _final_y - _hh, _final_x + _hw, _final_y + _hh);
    
    ui_alpha = lerp(ui_alpha, _hovering ? 1.0 : 0.5, 0.1);
    
    if (_hovering && mouse_check_button_pressed(mb_left) && !o_AboutPanel.closing) {
        click_scale = 0.75;
        with (o_AboutPanel) {
            image_index = (image_index > 0) ? image_index - 1 : 3;
        }
    }
    
    draw_sprite_ext(sprite_index, 0, _final_x, _final_y, click_scale, click_scale, 0, c_white, ui_alpha);
}