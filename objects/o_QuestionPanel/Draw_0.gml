draw_self();

if (variable_global_exists("jautajums")) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(f_FranklinGothicLarge);
    draw_set_alpha(global.panel_alpha);

    draw_text_transformed_color(x, y + - 350, global.jautajums, image_xscale * 2, 2, 0, c_white, c_white, c_white, c_white, global.panel_alpha);
    
    draw_set_alpha(1);
}

var _img = global.quizBildes[global.current_index];

if (sprite_exists(_img)) {
    var _targetW = 400;
    var _targetH = 300;
    
    var _x = (_targetW / sprite_get_width(_img)) * image_xscale;
    var _y = (_targetH / sprite_get_height(_img));

    draw_sprite_ext(_img, 0, x, y - 100,_x, _y, 0, c_white, global.panel_alpha);
}