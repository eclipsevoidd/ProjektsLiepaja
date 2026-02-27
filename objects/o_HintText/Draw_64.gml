draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(f_FranklinGothicMedLarge);

if (hover_text != "") {
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _gui_w = display_get_gui_width();
    
    var _pad = 8;
    var _w = string_width(hover_text);
    var _h = string_height(hover_text);
    var _offset_x = 15;
    
    if (_mx + _offset_x + _w + (_pad * 2) > _gui_w) {
        _offset_x = -(_w + (_pad * 2) + 15); 
    }
    
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(_mx + _offset_x, _my, _mx + _offset_x + _w + (_pad * 2), _my + _h, false);
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text(_mx + _offset_x + _pad, _my, hover_text);
}