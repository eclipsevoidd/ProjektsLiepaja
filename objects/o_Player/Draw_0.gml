draw_self()

if (is_shooting) {
    // --- POSITION & SIZE SETTINGS ---
    var _bar_w = 80;   
    var _bar_h = 12;  
    var _bar_x = x - (_bar_w / 2); 
    var _bar_y = y - 70;  
    
    // 1. DRAW BACKGROUND
    draw_set_color(c_dkgray);
    draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, false);
    
    // 2. DRAW ORANGE ZONE
    draw_set_color(c_orange);
    var _o_start = ((perfect_min - 10) / 100) * _bar_w;
    var _o_end   = ((perfect_max + 10) / 100) * _bar_w;
    draw_rectangle(_bar_x + _o_start, _bar_y, _bar_x + _o_end, _bar_y + _bar_h, false);

    // 3. DRAW GREEN ZONE 
    draw_set_color(c_lime);
    var _g_start = (perfect_min / 100) * _bar_w;
    var _g_end   = (perfect_max / 100) * _bar_w;
    draw_rectangle(_bar_x + _g_start, _bar_y, _bar_x + _g_end, _bar_y + _bar_h, false);
    
    // 4. DRAW BORDER 
    draw_set_color(c_black);
    draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, true);
    
    // 5. DRAW THE INDICATOR 
    draw_set_color(c_white);
    var _fill = (shot_value / 100) * _bar_w;
    draw_rectangle(_bar_x + _fill - 1, _bar_y - 2, _bar_x + _fill + 1, _bar_y + _bar_h + 2, false);
}