if (hit) {
    current_offset += 4;
    if (current_offset > rise_offset + 20) {
        o_gameController.popup_used[slot] = false;
        instance_destroy();
    }
    exit;
}

switch (phase) {
case 0: // Rising
    current_offset -= rise_speed;
    if (current_offset <= 0) { current_offset = 0; phase = 1; visible_timer = show_time; }
    break;
case 1: // Visible
    visible_timer--;
    if (visible_timer <= 0) phase = 2;
    break;
case 2: // Sinking — escaped
    current_offset += rise_speed;
    if (current_offset >= rise_offset) {
        with (o_gameController) { enemies_escaped++; score_val += pts_escaped; }
        var _t = instance_create_layer(x, y - 30, "Instances", o_txt);
        _t.text = string(o_gameController.pts_escaped); _t.col = c_orange;
        o_gameController.popup_used[slot] = false;
        instance_destroy();
    }
    break;
}