var _sw = display_get_gui_width();
var _sh = display_get_gui_height();
var _cx = _sw / 2;

// 1. Background Shading
draw_set_alpha(bg_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, _sw, _sh, false);
draw_set_alpha(1);

// Calculate the Top-Left corner needed to keep the panel centered
// Sprite width and height are taken from the actual asset
var _panel_w = sprite_get_width(s_AboutPanel) + 1000;
var _panel_h = sprite_get_height(s_AboutPanel);
var _draw_x = _cx - (_panel_w / 2);
var _draw_y = panel_y - (_panel_h / 2);

// 2. The Main Panel Sprite (Drawn using the calculated Top-Left corner)
draw_sprite_ext(s_NineSlicePanel, 0, _draw_x, _draw_y, 1, 1, 0, c_white, 1);

if (level_info != undefined) {
    // 3. Title Text (Still centered on _cx)
    draw_set_font(f_FranklinGothicMedLarge);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(_cx, _draw_y + 40, string_upper(level_info.name)); 

    // 4. Level Preview Image
    // Centered horizontally, positioned below the title
    draw_sprite(level_info.image, 0, _cx, _draw_y + 180);

    // 5. Lengthy Description (Wrapped)
    var _wrap_w = 420;
    var _line_h = 24;
    draw_set_font(f_FranklinGothicMedium); 
    // Positioned below the image
    draw_text_ext(_cx, _draw_y + 320, level_info.desc, _line_h, _wrap_w);

    // 6. The START Button Sprite
    // We assume s_StartPoga is centered. If it's also top-left, 
    // we apply the same math as the panel.
    var _btn_y = _draw_y + 520; 
    draw_sprite_ext(s_StartPoga, 0, _cx, _btn_y, 1, 1, 0, c_white, 1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_cx, _btn_y, "START");
    
    // 7. The CLOSE Button Sprite
    // Positioned relative to the panel's top-right corner
    draw_sprite_ext(s_Icon, 0, _draw_x + _panel_w - 40, _draw_y + 40, 1, 1, 0, c_white, 1);
}

// Reset Draws
draw_set_halign(fa_left);
draw_set_valign(fa_top);