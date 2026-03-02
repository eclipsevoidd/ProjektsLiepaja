pool_cx = 650;
pool_cy = 590;
pool_r_outer = 350;
pool_r_inner = 160;
pool_r_center = 125;
current_speed = 1.0; // was 1.2

// Timer: 60 seconds
timer_max = 60 * game_get_speed(gamespeed_fps);
timer = timer_max;
game_active = false;
game_ended = false;

game_state = "MENU";
score_total = 0;

// Difficulty — slower scaling
difficulty = 1;

// Spawn timers — slower spawns
spawn_timer_swimmer = 180;   // was 120
spawn_timer_coin = 20;       // was 30, coins spawn faster
spawn_timer_duck = 400;      // was 350
spawn_timer_ring = 200;      // was 300, rings spawn faster
fadeCalled = false;

// --- Create 2 jets instead of 3 ---
var _jet_angles = [85, 110];
for (var i = 0; i < 2; i++) {
	var _j = instance_create_layer(pool_cx, pool_cy, "Instances", o_Jet);
	_j.jet_angle = 97;
}

// --- Initial spawns - fewer swimmers, more coins ---
repeat (2) { // was 3
    var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
    _s.angle_pos = random(360);
    _s.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
    _s.spd = current_speed + random_range(-0.2, 0.2);
}
repeat (6) { // was 4
    var _c = instance_create_layer(0, 0, "Instances", o_Coin);
    _c.angle_pos = random(360);
    _c.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 20, random(1));
    _c.spd = current_speed;
}

btn_hw = 208;
btn_hh = 57;
btn_alpha = 0.6;