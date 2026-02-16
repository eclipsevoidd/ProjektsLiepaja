draw_self();

if (variable_global_exists("opcijas")) {
    
    // 2. Get the specific text for THIS button using its ID
    var _my_text = global.opcijas[global.current_index][button_id];

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(f_FranklinGothicLarge);
    
    // 3. Match the global opacity
    draw_set_alpha(global.panel_alpha);

    // 4. Match the width (image_xscale) so it animates with the button/panel
    draw_text_transformed_color(
        x, 
        y, 
        _my_text, 
        image_xscale, 
        1, 
        0, 
        c_white, c_white, c_white, c_white, 
        global.panel_alpha
    );

    // 5. Reset alpha for the rest of the game
    draw_set_alpha(1);
}