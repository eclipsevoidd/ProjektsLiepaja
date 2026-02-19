if (global.state == quizState.Game) {
    var _barW = 600;           
    var _barH = 12;            
    var _padding = 4;          
    var _x1 = (room_width / 2) - (_barW / 2);
    var _y1 = 25;              
    
    var _pct = clamp(global.currentTime / global.maxTime, 0, 1);
    var _hue = _pct * 120; 
    var _color = make_color_hsv(_hue, 230, 255);
    
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_roundrect(_x1 - _padding, _y1 - _padding, _x1 + _barW + _padding, _y1 + _barH + _padding, false);
    
    draw_set_color(c_dkgray);
    draw_set_alpha(1);
    draw_rectangle(_x1, _y1, _x1 + _barW, _y1 + _barH, false);
    
    draw_set_color(_color);
    if (_pct > 0) {
        draw_rectangle(_x1, _y1, _x1 + (_barW * _pct), _y1 + _barH, false);
    }
    
    draw_set_color(c_white);
    draw_set_alpha(0.2);
    draw_rectangle(_x1, _y1, _x1 + (_barW * _pct), _y1 + (_barH / 2), false);
    
    draw_set_alpha(1);
    draw_set_color(c_white);
}