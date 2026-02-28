draw_self();

if (variable_global_exists("quizOptions")) {
    var _my_text = global.quizOptions[global.current_index][button_id];

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(f_FranklinGothicLarge);
    draw_set_alpha(global.panel_alpha);

    draw_text_transformed_color(x, y, _my_text, image_xscale, 1, 0, c_white, c_white, c_white, c_white, global.panel_alpha);
    
    draw_set_alpha(1);
}