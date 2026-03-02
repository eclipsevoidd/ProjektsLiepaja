if (!audio_is_playing(snd_PoolAmbience)) {
    audio_play_sound(snd_PoolAmbience, 10, true);
}

if (game_state == "MENU") exit;
if (game_state == "ENDED") exit;

// === PLAYING ===
timer -= 1;
if (timer <= 0 && !fadeCalled) {
    fadeCalled = true;
    timer = 0;
    game_active = false;
    game_ended = true;
    scr_submit_score(GAME.SPA, max(0, score_total));
    completeMinigame(2);
    fadeToRoom(rm_AfterPool, 1, 1);
    exit;
}

// Much slower difficulty scaling (was 0.7, now 0.4)
difficulty = 1 + (1 - (timer / timer_max)) * 0.4;

// --- Spawn swimmers (max 4, was 6) ---
spawn_timer_swimmer -= 1;
if (spawn_timer_swimmer <= 0) {
    var _player = instance_find(o_PlayerSpa, 0);
    if (instance_number(o_Swimmer) < min(4, 2 + floor(difficulty))) { // was min(6, 2+floor(diff*2))
        var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
        _s.angle_pos = instance_exists(_player) ? _player.angle_pos + 180 + random_range(-60, 60) : random(360);
        _s.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
        _s.spd = current_speed + random_range(-0.3, 0.4) * difficulty; // was -0.5, 0.6
    }
    spawn_timer_swimmer = floor(random_range(140, 200) / difficulty); // slower spawns
}

// --- Spawn coins (more frequent) ---
spawn_timer_coin -= 1;
if (spawn_timer_coin <= 0) {
    if (instance_number(o_Coin) < 8) { // was 6
        var _c = instance_create_layer(0, 0, "Instances", o_Coin);
        _c.angle_pos = random(360);
        _c.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 20, random(1));
        _c.spd = current_speed;
    }
    spawn_timer_coin = floor(random_range(40, 70) / difficulty); // was 60-100
}

// --- Spawn ducks (less frequent) ---
spawn_timer_duck -= 1;
if (spawn_timer_duck <= 0) {
    if (instance_number(o_Duck) < 1) { // was 2
        var _d = instance_create_layer(0, 0, "Instances", o_Duck);
        _d.angle_pos = random(360);
        _d.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
        _d.spd = current_speed + random_range(-0.2, 0.2);
    }
    spawn_timer_duck = floor(random_range(350, 500) / difficulty); // slower
}

// --- Spawn speed rings (more frequent) ---
spawn_timer_ring -= 1;
if (spawn_timer_ring <= 0) {
    if (instance_number(o_Speed_Ring) < 3) { // was 2
        var _r = instance_create_layer(0, 0, "Instances", o_Speed_Ring);
        _r.angle_pos = random(360);
        _r.radius_pos = lerp(pool_r_inner + 30, pool_r_outer - 30, random(1));
        _r.spd = current_speed;
    }
    spawn_timer_ring = floor(random_range(150, 280) / difficulty); // was 220-400
}