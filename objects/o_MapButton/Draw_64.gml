if (hover_alpha > 0.01) {
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    var _gui_x = x - _cam_x;
    var _gui_y = y - _cam_y;
	
	var _data = get_level_data(level);
    var _name = string_upper(location_name); 
    var _desc = _data.description;

    var _name = string_upper(location_name); 
    var _desc = location_description;
    
    var _wrap_w = 320; 
    var _line_h = 22;
    var _padding = 16;
    var _title_space = 35;
    
    draw_set_font(f_FranklinGothicMedium);
    var _text_h = string_height_ext(_desc, _line_h, _wrap_w);
    
    var _box_w = _wrap_w + (_padding * 2);
    var _box_h = _text_h + _title_space + (_padding * 2);
    
    var _margin = 50; 
    var _x1 = _gui_x - (_box_w / 2);
    var _y1 = _gui_y - _box_h - _margin;
    
    _x1 = clamp(_x1, 10, display_get_gui_width() - _box_w - 10);
    _y1 = max(10, _y1); 
    
    var _x2 = _x1 + _box_w;
    var _y2 = _y1 + _box_h;

    // 5. Draw the Simple Black Background
    draw_set_alpha(hover_alpha * 0.9); // Slightly transparent black
    draw_set_color(c_black);
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    
    // 6. Draw Title
    draw_set_alpha(hover_alpha);
    draw_set_color(c_white);
    draw_set_font(f_FranklinGothicMedLarge);
    draw_set_halign(fa_center);
    // Draw title centered relative to the BOX, not the button (due to the clamp)
    draw_text(_x1 + (_box_w / 2), _y1 + _padding, _name);
    
    // 7. Draw Description
    draw_set_font(f_FranklinGothicMedium);
    draw_text_ext(_x1 + (_box_w / 2), _y1 + _padding + _title_space, _desc, _line_h, _wrap_w);

    // Reset Draw State
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}