if (!instance_exists(o_prisonPlayer)) exit; // Stop if no player

if (!canMove) {
	path_end();
    freezeTimer -= delta_time; // delta_time = microseconds passed this step
    if (freezeTimer <= 0){
		canMove = true;
		freezeTimer = 15 * 1000000;
	}
	exit; // stop movement
}

// --- Recalculate path if needed ---
if (path == noone || distance_to_object(o_prisonPlayer) > 32) {
    if (path != noone) path_delete(path);  // Delete old path

    path = path_add();
    mp_grid_path(
        mp_grid,
        path,
        x, y,
        o_prisonPlayer.x,
        o_prisonPlayer.y,
        true
    );

    path_start(path, 3, path_action_stop, false);
}

if (!variable_instance_exists(id, "prev_x")) prev_x = x;

var dx = x - prev_x; 
if (dx > 0) facing_right = true;
else if (dx < 0) facing_right = false;

prev_x = x;

// --- Handle frame delay ---
frame_timer += 1;
if (frame_timer >= frame_delay) {
    frame_index += 1;
    frame_timer = 0;

    if (frame_index >= sprite_get_number(sprite_index)) {
        frame_index = 0;
    }
}

// Apply current frame and flip horizontally
image_index = frame_index;
image_xscale = facing_right ? 1 : -1;
