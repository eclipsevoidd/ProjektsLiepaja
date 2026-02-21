pool_cx = 650;
pool_cy = 590;
pool_r_outer = 350;
pool_r_inner = 160;
pool_r_center = 125;

// --- Current speed (degrees per frame) ---
current_speed = 1.2;

// --- Timer: 60 seconds ---
timer_max = 60 * game_get_speed(gamespeed_fps);
timer = timer_max;
game_active = true;
game_ended = false;

// --- Score ---
score_total = 0;

// --- Difficulty ---
difficulty = 1;

// --- Spawn timers ---
spawn_timer_swimmer = 90;
spawn_timer_coin = 20;
spawn_timer_duck = 300;
spawn_timer_ring = 280;

// --- Create 3 jets ---
var _jet_angles = [80, 97, 114];
for (var i = 0; i < 3; i++) {
    var _j = instance_create_layer(pool_cx, pool_cy, "Instances", o_Jet);
    _j.jet_angle = _jet_angles[i];
}

// --- Initial spawns ---
repeat (3) {
    var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
    _s.angle_pos = random(360);
    _s.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
    _s.spd = current_speed + random_range(-0.3, 0.3);
}
repeat (4) {
    var _c = instance_create_layer(0, 0, "Instances", o_Coin);
    _c.angle_pos = random(360);
    _c.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 20, random(1));
    _c.spd = current_speed;
}