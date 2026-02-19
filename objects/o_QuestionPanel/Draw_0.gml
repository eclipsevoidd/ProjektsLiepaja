draw_self();

// 1. TEXT RENDERING
if (variable_global_exists("jautajums")) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(f_FranklinGothicLarge);
    
    draw_text_transformed_color(x, y - 350, global.jautajums, image_xscale * 2, 2, 0, c_white, c_white, c_white, c_white, global.panel_alpha);
}

// 2. IMAGE RENDERING
var _img = global.quizBildes[global.current_index];

if (sprite_exists(_img)) {
    var _targetW = 400;
    var _targetH = 300;
    
    // Scale based on target size vs actual sprite size
    var _scaleX = (_targetW / sprite_get_width(_img)) * image_xscale;
    var _scaleY = (_targetH / sprite_get_height(_img)) * image_xscale;

    draw_sprite_ext(_img, 0, x, y - 100, _scaleX, _scaleY, 0, c_white, global.panel_alpha);
}

draw_set_alpha(1);