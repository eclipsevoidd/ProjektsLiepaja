pool_cx = 650;
pool_cy = 590;
pool_r_outer = 350;
pool_r_inner = 160;
pool_r_center = 125;

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

// Button
btn_hw = 208;
btn_hh = 57;
btn_alpha = 0.6;