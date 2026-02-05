if (race_active && !race_finished) {
    // Detect crossing the finish line from left to right
    if (o_Car.x > finish_line_x && o_Car.xprevious <= finish_line_x) {
        current_lap++;
        
        if (current_lap >= total_laps) {
            race_finished = true;
            race_active = false;
            final_time = (get_timer() - start_time) / 1000000;
        }
    }
}