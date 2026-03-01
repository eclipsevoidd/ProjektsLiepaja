
if (screen_shake > 0) {
    screen_shake -= 0.4;
    camera_set_view_pos(view_camera[0],
        irandom_range(-screen_shake, screen_shake),
        irandom_range(-screen_shake, screen_shake));
} else {
    camera_set_view_pos(view_camera[0], 0, 0);
}

switch (state) {

case GS.MENU:
    window_set_cursor(cr_default);
    break;

case GS.INTRO:
    state = GS.PLAYING;
    break;

case GS.PLAYING:
    game_time--;
    if (game_time <= 0) {
        state = GS.RESULTS;
        with (o_enemy_ship) instance_destroy();
        with (o_enemy_soldier) instance_destroy();
        with (o_enemy_popup) instance_destroy();
        break;
    }

    var _prog = 1 - (game_time / 3600);
    var _spd = 1 + _prog * 0.5;
    var _spn = lerp(1.0, 0.55, _prog);

    // Spawn ships
    ship_timer--;
    if (ship_timer <= 0) {
        var _s = instance_create_layer(ship_spawn_x, random_range(ship_y_min, ship_y_max), "Instances", o_enemy_ship);
        _s.spd = random_range(ship_speed_min, ship_speed_max) * _spd;
        _s.exit_x = ship_exit_x;
        enemies_spawned++;
        ship_timer = ship_interval * _spn + irandom_range(-15, 15);
    }

    // Spawn soldiers
    soldier_timer--;
    if (soldier_timer <= 0) {
        var _sol = instance_create_layer(random_range(soldier_x_min, soldier_x_max), soldier_spawn_y, "Instances", o_enemy_soldier);
        _sol.spd = random_range(soldier_speed_min, soldier_speed_max) * _spd;
        _sol.exit_y = soldier_exit_y;
        enemies_spawned++;
        soldier_timer = soldier_interval * _spn + irandom_range(-20, 20);
    }

    // Spawn popups
    popup_timer--;
    if (popup_timer <= 0) {
        var _free = -1;
        var _st = irandom(popup_count - 1);
        for (var i = 0; i < popup_count; i++) {
            var _idx = (i + _st) mod popup_count;
            if (!popup_used[_idx]) { _free = _idx; break; }
        }
        if (_free != -1) {
            popup_used[_free] = true;
            var _p = instance_create_layer(popup_pos[_free][0], popup_pos[_free][1], "Instances", o_enemy_popup);
            _p.slot = _free;
            _p.show_time = popup_show_time * lerp(1.0, 0.65, _prog);
            enemies_spawned++;
        }
        popup_timer = popup_interval * _spn + irandom_range(-10, 10);
    }
    break;

case GS.RESULTS:
	scr_submit_score(GAME.FORTI, score_val);
	completeMinigame(GAME.FORTI);
    if (mouse_check_button_pressed(mb_left)) {
		fadeToRoom(rm_ZiemeluFortiOutro, 1, 1);
	}
    break;
}