function scr_submit_score(_game_id, _score) {

    if (global.scores[_game_id] == -1) {
        global.scores[_game_id] = _score;
    } else {
        global.scores[_game_id] = max(global.scores[_game_id], _score);
    }
}
