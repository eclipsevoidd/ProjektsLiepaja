if (game_ended) exit;
if (!game_active) exit;

timer -= 1;
if (timer <= 0) {
    timer = 0;
    game_active = false;
    game_ended = true;
	scr_submit_score(GAME.POOL, score_total);
    exit;
}

difficulty = 1 + (1 - (timer / timer_max));

// --- Spawn swimmers ---
spawn_timer_swimmer -= 1;
if (spawn_timer_swimmer <= 0) {
    var _player = instance_find(o_PlayerSpa, 0);
    if (instance_number(o_Swimmer) < min(10, 3 + floor(difficulty * 3))) {
        var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
        _s.angle_pos = instance_exists(_player) ? _player.angle_pos + 180 + random_range(-60, 60) : random(360);
        _s.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
        _s.spd = current_speed + random_range(-0.5, 0.6) * difficulty;
    }
    spawn_timer_swimmer = floor(random_range(80, 140) / difficulty);
}

// --- Spawn coins ---
spawn_timer_coin -= 1;
if (spawn_timer_coin <= 0) {
    if (instance_number(o_Coin) < 8) {
        var _c = instance_create_layer(0, 0, "Instances", o_Coin);
        _c.angle_pos = random(360);
        _c.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 20, random(1));
        _c.spd = current_speed;
    }
    spawn_timer_coin = floor(random_range(50, 90) / difficulty);
}

// --- Spawn ducks ---
spawn_timer_duck -= 1;
if (spawn_timer_duck <= 0) {
    if (instance_number(o_Duck) < 2) {
        var _d = instance_create_layer(0, 0, "Instances", o_Duck);
        _d.angle_pos = random(360);
        _d.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
        _d.spd = current_speed + random_range(-0.2, 0.2);
    }
    spawn_timer_duck = floor(random_range(250, 400) / difficulty);
}

// --- Spawn speed rings ---
spawn_timer_ring -= 1;
if (spawn_timer_ring <= 0) {
    if (instance_number(o_Speed_Ring) < 2) {
        var _r = instance_create_layer(0, 0, "Instances", o_Speed_Ring);
        _r.angle_pos = random(360);
        _r.radius_pos = lerp(pool_r_inner + 30, pool_r_outer - 30, random(1));
        _r.spd = current_speed;
    }
    spawn_timer_ring = floor(random_range(200, 380) / difficulty);
}