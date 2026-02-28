/// @func scr_submit_score(game_id, score)
/// @desc Call this when a minigame ends to save the player's score.
///       If the player replays a game, it keeps the BEST score.
/// @arg {real} game_id   One of the GAME enum values (e.g. GAME.KATEDRALE)
/// @arg {real} score     The score the player earned
function scr_submit_score(_game_id, _score) {
    // Keep best score if replayed
    if (global.scores[_game_id] == -1) {
        global.scores[_game_id] = _score;
    } else {
        global.scores[_game_id] = max(global.scores[_game_id], _score);
    }
}
