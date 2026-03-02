function scr_finalize_player() {
    var _total_score = scr_get_total_score(); // Get it once
    var _entry = {
        name:    global.player_name,
        total:   _total_score,
        time:    global.playTime,
        p_score: _total_score  // Use the local variable instead of a global one
    };	
    
    array_push(global.leaderboard, _entry);
    
    // Sort by time ascending (fastest first) per P10
    array_sort(global.leaderboard, function(_a, _b) {
        return _a.time - _b.time;
    });
    
    // Keep top 10
    if (array_length(global.leaderboard) > 10) {
        array_resize(global.leaderboard, 10);
    }
    
    // Save to file
    var _file = file_text_open_write("leaderboard.json");
    file_text_write_string(_file, json_stringify(global.leaderboard));
    file_text_close(_file);
    
    global.isRunning = false;
}