function scr_get_total_score() {
    var _total = 0;
    for (var i = 0; i < GAME.COUNT; i++) {
        if (global.scores[i] > 0) {
            _total += global.scores[i];
        }
    }
    return _total;
}
