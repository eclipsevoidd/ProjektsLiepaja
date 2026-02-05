draw_set_font(-1); // Use default font or your custom font
draw_set_color(c_white);

// START SCREEN
if (!race_active && !race_finished) {
    draw_set_halign(fa_center);
    draw_text(room_width/2, room_height/2, "PRESS SPACE TO START RACE");
    
    if (keyboard_check_pressed(vk_space)) {
        // SPAWN CAR AT YOUR SPECIFIC COORDINATES
        o_Car.x = 1701;
        o_Car.y = 2205;
        o_Car.speed_val = 0;
        o_Car.move_dir = 0;
        o_Car.image_angle = 0;
        
        race_active = true;
        race_finished = false;
        start_time = get_timer();
        current_lap = 0;
        player_points = 100;
    }
}

// RACING HUD
if (race_active) {
    draw_set_halign(fa_left);
    var _timer = (get_timer() - start_time) / 1000000;
    draw_text(20, 20, "LAP: " + string(current_lap) + " / " + string(total_laps));
    draw_text(20, 40, "TIME: " + string_format(_timer, 2, 2));
    draw_text(20, 60, "SCORE: " + string(player_points));
}

// END SCREEN
if (race_finished) {
    draw_set_halign(fa_center);
    draw_text(room_width/2, room_height/2 - 40, "RACE COMPLETE!");
    draw_text(room_width/2, room_height/2, "TIME: " + string_format(final_time, 2, 2));
    draw_text(room_width/2, room_height/2 + 20, "FINAL SCORE: " + string(player_points));
    draw_text(room_width/2, room_height/2 + 60, "PRESS 'R' TO RESTART");
    
    if (keyboard_check_pressed(ord("R"))) room_restart();
}