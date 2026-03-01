

// === MENU ===
if (game_state == "MENU") {
    exit;
}

// === COUNTDOWN ===
if (game_state == "COUNTDOWN") {
    countdown_timer--;
    
    // Lock car in place
    o_Car.speed_val = 0;
    
    if (countdown_timer <= 0) {
        game_state = "RACING";
        start_time = get_timer();
        lap_start_time = get_timer();
    }
    exit;
}

// === RACING ===
if (game_state == "RACING") {
    // Detect finish line crossing (left to right)
    if (o_Car.x > finish_line_x && o_Car.xprevious <= finish_line_x) {
        // Save lap time
		
		audio_play_sound(snd_lap_ding, 15, false);
		
        var _lap_time = (get_timer() - lap_start_time) / 1000000;
        array_push(lap_times, _lap_time);
        if (_lap_time < best_lap_time) best_lap_time = _lap_time;
        
        current_lap++;
        lap_start_time = get_timer();
        
        if (current_lap >= total_laps) {
            game_state = "FINISHED";
            final_time = (get_timer() - start_time) / 1000000;
            
            var _time_score = (1 - clamp((final_time - par_time) / (max_time - par_time), 0, 1)) * 100;
            
            // Wall hit penalty: -2 pts per hit, minimum 0
            var _wall_penalty = wall_hits * 2;
            
            final_score = max(0, floor(_time_score - _wall_penalty));
        }
    }
    exit;
}