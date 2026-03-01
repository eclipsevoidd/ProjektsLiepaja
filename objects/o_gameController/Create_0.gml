enum GS { MENU, INTRO, PLAYING, RESULTS }
state = GS.MENU;
intro_timer = 150;

if (!variable_global_exists("scores")) {
    global.scores = [];
    for (var i = 0; i < 20; i++) {
        global.scores[i] = -1;
    }
}

game_time = 60 * 60; // 1 minute

// Score & stats
score_val = 0;
total_shots = 0;
total_hits = 0;
enemies_spawned = 0;
enemies_hit = 0;
enemies_escaped = 0;

// Point values
pts_ship = 2;
pts_soldier = 1;
pts_popup = 2;
pts_miss = -2;
pts_escaped = -5;

// Spawn timers & intervals
ship_timer = 160;
soldier_timer = 120;
popup_timer = 70;
ship_interval = 180;
soldier_interval = 280;
popup_interval = 130;

// Ships (right side, sea) — ADJUST Y to match your image
ship_spawn_x = 2000;
ship_y_min = 300;
ship_y_max = 480;
ship_speed_min = 1.5;
ship_speed_max = 3.0;
ship_exit_x = 1100;

// Soldiers (left side, land) — ADJUST Y to match your image
soldier_spawn_y = 500;
soldier_x_min = 100;
soldier_x_max = 400;
soldier_speed_min = 1.0;
soldier_speed_max = 1.8;
soldier_exit_y = 1000;

// Popup positions (center, ruins) — ADJUST X,Y to ruin tops in your image
popup_pos[0] = [1200, 525];
popup_pos[1] = [900, 320];
popup_pos[2] = [725, 480];
popup_pos[3] = [500, 300];
popup_count = 4;
for (var i = 0; i < popup_count; i++) popup_used[i] = false;
popup_show_time = 120;

screen_shake = 0;
window_set_cursor(cr_none);

// Button
btn_hw = 208;
btn_hh = 57;
btn_alpha = 0.6;