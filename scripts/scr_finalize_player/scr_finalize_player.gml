/// @func scr_finalize_player()
/// @desc Call this when the player finishes ALL minigames.
///       Saves their scores to the leaderboard and resets for next player.
function scr_finalize_player() {
    var _entry = {
        name:   global.player_name,
        scores: array_create(GAME.COUNT),
        total:  0,
        time:   global.playTime
    };
    
    for (var i = 0; i < GAME.COUNT; i++) {
        _entry.scores[i] = global.scores[i];
        if (global.scores[i] > 0) {
            _entry.total += global.scores[i];
        }
    }
    
    // Add to leaderboard
    array_push(global.leaderboard, _entry);
    
    // Sort leaderboard by total score (descending)
    array_sort(global.leaderboard, function(_a, _b) {
        return _b.total - _a.total;  // higher score first
    });
    
    // Reset for next player
    for (var i = 0; i < GAME.COUNT; i++) {
        global.scores[i] = -1;
    }
    global.player_name = "Player";
    global.playTime = 0;
    global.isRunning = false;
}
