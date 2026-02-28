draw_set_font(f_FranklinGothicMedium);

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _cx = _w / 2;
var _cy = _h / 2;

// === MENU ===
if (game_state == "MENU") {
    draw_set_alpha(0.55);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    // Title
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _cy - 100, "DRIFTA ARENA", 3, 3, 0);
    
    draw_set_color(c_gray);
    draw_text(_cx, _cy - 50, string(total_laps) + " apļi");
    
    // "Sākt Sacīkstes" button
    var _btn_x = _cx;
    var _btn_y = _cy + 30;
    
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _over = point_in_rectangle(_mx, _my, _btn_x - btn_hw, _btn_y - btn_hh, _btn_x + btn_hw, _btn_y + btn_hh);
    btn_alpha = lerp(btn_alpha, _over ? 1.0 : 0.6, 0.12);
    
    draw_sprite_ext(s_StartPoga, 0, _btn_x, _btn_y, 1, 1, 0, c_white, btn_alpha);
    
    if (mouse_check_button_pressed(mb_left) && _over) {
        // Set car start position
        o_Car.x = 1800;
        o_Car.y = 2330;
        o_Car.speed_val = 0;
        o_Car.move_dir = 0;
        o_Car.image_angle = 0;
        
        current_lap = 0;
        wall_hits = 0;
        best_lap_time = 9999;
        lap_times = [];
        
        game_state = "COUNTDOWN";
        countdown_timer = 180;  // 3 seconds at 60fps
    }
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    exit;
}

// === COUNTDOWN ===
if (game_state == "COUNTDOWN") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _num = clamp(ceil(countdown_timer / 60), 1, 3);
    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _cy, string(_num), 6, 6, 0);
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    exit;
}

// === RACING HUD ===
if (game_state == "RACING") {
    var _timer = (get_timer() - start_time) / 1000000;
    var _lap_timer = (get_timer() - lap_start_time) / 1000000;
    
    // Dark background for HUD
    draw_set_alpha(0.5); draw_set_color(c_black);
    draw_roundrect(10, 10, 280, 95, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    
    // Lap
    draw_set_color(c_yellow);
    draw_text(20, 15, "APLIS: " + string(current_lap + 1) + " / " + string(total_laps));
    
    // Total time
    draw_set_color(c_white);
    draw_text(20, 38, "LAIKS: " + scr_format_time(_timer));
    
    // Current lap time
    draw_set_color(c_aqua);
    draw_text(20, 58, "APLIS: " + scr_format_time(_lap_timer));
    
    // Wall hits
    draw_set_color(wall_hits > 0 ? c_red : c_lime);
    draw_text(20, 78, "TRIECIENI: " + string(wall_hits));
    
    exit;
}

// === FINISHED ===
if (game_state == "FINISHED") {
    draw_set_alpha(0.8); draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    
    // Title
    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _cy - 140, "SACĪKSTES PABEIGTAS!", 2.5, 2.5, 0);
    
    // Total time
    draw_set_color(c_white);
    draw_text_transformed(_cx, _cy - 80, "Kopējais laiks: " + scr_format_time(final_time), 1.5, 1.5, 0);
    
    // Best lap
    draw_set_color(c_aqua);
    draw_text_transformed(_cx, _cy - 45, "Labākais aplis: " + scr_format_time(best_lap_time), 1.5, 1.5, 0);
    
    // Lap breakdown
    draw_set_color(c_ltgray);
    for (var i = 0; i < array_length(lap_times); i++) {
        draw_text(_cx, _cy - 10 + i * 25, "Aplis " + string(i + 1) + ": " + scr_format_time(lap_times[i]));
    }
    
    // Wall hits
    var _stats_y = _cy - 10 + array_length(lap_times) * 25 + 15;
    draw_set_color(wall_hits > 0 ? c_red : c_lime);
    draw_text(_cx, _stats_y, "Sienu triecieni: " + string(wall_hits) + " (-" + string(wall_hits * 2) + " punkti)");
    
    // Final score
    var _score_y = _stats_y + 40;
    draw_set_color(c_yellow);
    draw_text_transformed(_cx, _score_y, "PUNKTI: " + string(final_score) + " / 100", 2, 2, 0);
    
    // Prompt
    draw_set_color(c_gray);
    draw_text(_cx, _score_y + 50, "Nospied ENTER lai turpinātu");
    
    if (keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
        room_goto(rm_MainMenu);
    }
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    exit;
}

draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_set_color(c_white); draw_set_alpha(1);


/// Helper — format seconds to M:SS.mm
function scr_format_time(_seconds) {
    var _m = floor(_seconds / 60);
    var _s = floor(_seconds) mod 60;
    var _ms = floor(frac(_seconds) * 100);
    return string(_m) + ":" + ((_s < 10) ? "0" : "") + string(_s) + "." + ((_ms < 10) ? "0" : "") + string(_ms);
}