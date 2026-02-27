function scr_hit(_x, _y, _pts) {
    with (o_gameController) {
        score_val += _pts;
        total_hits++;
        enemies_hit++;
        screen_shake = max(screen_shake, 3);
        with (o_crosshair) hit_anim = 4;
    }

    var _t = instance_create_layer(_x, _y - 20, "Instances", o_txt);
    _t.text = "+" + string(_pts);
    _t.col = c_lime;
}