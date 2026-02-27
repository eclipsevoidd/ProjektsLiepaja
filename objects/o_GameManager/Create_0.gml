
game_state = "MENU";

// Race
total_laps = 3;
current_lap = 0;
start_time = 0;
final_time = 0;

// Per-lap timing
lap_start_time = 0;
best_lap_time = 9999;
lap_times = [];

// Wall hits
wall_hits = 0;

// Finish line
finish_line_x = 1560;

// Countdown
countdown_timer = 0;

// Final score (calculated at end)
final_score = 0;


par_time = 45;       // "perfect" time in seconds
max_time = 120;      // worst reasonable time

// Button (GUI coords — recalculate each frame like basketball)
btn_hw = 208;
btn_hh = 57;
btn_alpha = 0.6;