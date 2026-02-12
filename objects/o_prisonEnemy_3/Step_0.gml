if (!instance_exists(o_prisonPlayer)) exit;

// Recalculate path if needed
if (path == noone || distance_to_object(o_prisonPlayer) > 32)
{
    if (path != noone) path_delete(path);

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
