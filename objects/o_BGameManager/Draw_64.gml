// --- 1. ALWAYS VISIBLE UI (Instructions) ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// Top Left: Game Modes
draw_text(20, 20, "1 - Practice Mode");
draw_text(20, 40, "2 - Match Mode (NPC)");

// Top Left: Controls
draw_text(20, 80, "E - Shoot");
draw_text(20, 100, "Q - Dribble/Protect");


// --- 2. MINIGAME UI ---
if (global.game_state == "MINIGAME") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Draw a dark overlay
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    // Draw the Prompt
    draw_set_color(c_yellow);
    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2 - 50, "BUMBAS UZMETIES!", 2, 2, 0);
    
    draw_set_color(c_white);
    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2, "NOSPIED: " + global.mini_key, 4, 4, 0);
    
    // Draw timer bar
    var _w = (global.mini_timer / 60) * 200;
    draw_rectangle(display_get_gui_width()/2 - 100, display_get_gui_height()/2 + 60, display_get_gui_width()/2 - 100 + _w, display_get_gui_height()/2 + 80, false);
}

// --- 3. SCORE UI ---
if (global.game_state == "POST_SCORE") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_orange);
    
    // Make it "pulse" or grow slightly
    var _scale = 2 + sin(current_time / 100) * 0.2;
    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2, "Punkts!!!", _scale, _scale, 0);
}