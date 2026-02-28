if (!counted) {
    counted = true;
    if (instance_exists(o_TarzanManager)) {
        o_TarzanManager.death_count++;
    }
}

timer--;
if (timer <= 0) {
    room_restart();
    instance_destroy();
}