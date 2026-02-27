// 1. CHOOSE THE COLOR
var _trail_color = (scored) ? c_yellow : c_ltgray;

// 2. DRAW THE TRAIL
for (var i = 0; i < trail_length; i++) {
    // Fade the alpha and shrink the scale as the trail goes back
    var _alpha = 0.4 - (i / trail_length) * 0.4; 
    var _scale = 1.0 - (i / trail_length) * 0.5;
    
    draw_sprite_ext(sprite_index, image_index, trail_x[i], trail_y[i], 
                    image_xscale * _scale, image_yscale * _scale, 
                    image_angle, _trail_color, _alpha);
}

// 3. DRAW THE ACTUAL BALL
draw_self();