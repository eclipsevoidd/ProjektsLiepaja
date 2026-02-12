// 1️⃣ Avoid piling up
var colliding = instance_place(x, y, o_prisonEnemy_1);
if (colliding)
{
    move_towards_point(x + 16, y + 16, 1); // nudge away
}

// 2️⃣ Only recalc path if needed
if (path == noone || distance_to_object(o_prisonPlayer) > 32)
{
    if (path != noone) path_delete(path);

    path = path_add();
    
    var target_x = o_prisonPlayer.x; // you can add random offsets here
    var target_y = o_prisonPlayer.y;

    mp_grid_path(mp_grid, path, x, y, target_x, target_y, true);
    path_start(path, 2, path_action_stop, false);
}
