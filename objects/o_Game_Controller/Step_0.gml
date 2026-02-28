// === MENU ===
if (game_state == "MENU") exit;

// === ENDED ===
if (game_state == "ENDED") exit;

// === PLAYING ===
timer -= 1;
if (timer <= 0) {
    timer = 0;
    game_active = false;
    game_ended = true;
    game_state = "ENDED";
    exit;
}

// Lēnāka grūtības pieaugšana (bija 1 + (1 - timer/max))
difficulty = 1 + (1 - (timer / timer_max)) * 0.7;

// --- Spawn swimmers (max 6, bija 10) ---
spawn_timer_swimmer -= 1;
if (spawn_timer_swimmer <= 0) {
    var _player = instance_find(o_PlayerSpa, 0);
    if (instance_number(o_Swimmer) < min(6, 2 + floor(difficulty * 2))) {
        var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
        _s.angle_pos = instance_exists(_player) ? _player.angle_pos + 180 + random_range(-60, 60) : random(360);
        _s.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
        _s.spd = current_speed + random_range(-0.3, 0.4) * difficulty;
    }
    spawn_timer_swimmer = floor(random_range(100, 160) / difficulty);
}

// --- Spawn coins ---
spawn_timer_coin -= 1;
if (spawn_timer_coin <= 0) {
    if (instance_number(o_Coin) < 6) {
        var _c = instance_create_layer(0, 0, "Instances", o_Coin);
        _c.angle_pos = random(360);
        _c.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 20, random(1));
        _c.spd = current_speed;
    }
    spawn_timer_coin = floor(random_range(60, 100) / difficulty);
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
    spawn_timer_duck = floor(random_range(280, 420) / difficulty);
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
    spawn_timer_ring = floor(random_range(220, 400) / difficulty);
}