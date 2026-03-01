CIETUMS_cx = 650;
CIETUMS_cy = 590;
CIETUMS_r_outer = 350;
CIETUMS_r_inner = 160;
CIETUMS_r_center = 125;

current_speed = 1.2;

// Timer: 60 seconds
timer_max = 60 * game_get_speed(gamespeed_fps);
timer = timer_max;
game_active = false;   // <-- sāk kā false (menu)
game_ended = false;

// State
game_state = "MENU";   // "MENU", "PLAYING", "ENDED"

// Score
score_total = 0;

// Difficulty — lēnāka pieaugšana
difficulty = 1;

// Spawn timers — retāk spawno
spawn_timer_swimmer = 120;   // bija 90
spawn_timer_coin = 30;       // bija 20
spawn_timer_duck = 350;      // bija 300
spawn_timer_ring = 300;      // bija 280

// --- Create 3 jets ---
var _jet_angles = [80, 97, 114];
for (var i = 0; i < 3; i++) {
    var _j = instance_create_layer(CIETUMS_cx, CIETUMS_cy, "Instances", o_Jet);
    _j.jet_angle = _jet_angles[i];
}

// --- Initial spawns ---
repeat (3) {
    var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
    _s.angle_pos = random(360);
    _s.radius_pos = lerp(CIETUMS_r_inner + 25, CIETUMS_r_outer - 25, random(1));
    _s.spd = current_speed + random_range(-0.3, 0.3);
}
repeat (4) {
    var _c = instance_create_layer(0, 0, "Instances", o_Coin);
    _c.angle_pos = random(360);
    _c.radius_pos = lerp(CIETUMS_r_inner + 25, CIETUMS_r_outer - 20, random(1));
    _c.spd = current_speed;
}
// Button
btn_hw = 208;
btn_hh = 57;
btn_alpha = 0.6;
