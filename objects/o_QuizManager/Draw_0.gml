if (global.state == quizState.Intro) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _display_val = ceil(countdown_timer);

	// 1. Only start drawing once we are below 3.0 (after the 1s wait)
	if (countdown_timer <= 3 && _display_val > 0) {
    
	    // Get the fractional part (0.0 to 0.99)
	    var _frac = countdown_timer - floor(countdown_timer);
    
	    // 2. Fade & Scale Logic
	    // _frac starts at 0.99 and goes to 0.0 every second.
	    var _alpha = _frac; // Fades out as the second reaches the end
	    var _scale = 3 + (_frac * 2); // Shrinks from 5 down to 3
    
	    draw_set_alpha(_alpha);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
    
	    draw_text_transformed(room_width / 2, room_height / 2, string(_display_val), _scale, _scale, 0);
    
	    draw_set_alpha(1); // Reset alpha so other things aren't transparent
	}
}

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