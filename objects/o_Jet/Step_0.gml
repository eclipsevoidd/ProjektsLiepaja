var _ctrl = instance_find(o_Game_Controller, 0);
if (!instance_exists(_ctrl) || !_ctrl.game_active) exit;
state_timer -= 1;
switch (state) {
    case "idle":
        firing = false; warning = false; stream_progress = 0;
        if (state_timer <= 0) { state = "warning"; state_timer = warning_duration; }
        break;
    case "warning":
        warning = true; firing = false;
        if (state_timer <= 0) { state = "firing"; state_timer = fire_duration; stream_progress = 0; }
        break;
    case "firing":
        warning = false; firing = true;
        stream_progress = min(1, stream_progress + 0.03); // was 0.05 — slower stream
        if (state_timer <= 0) { state = "idle"; state_timer = floor(cooldown_duration / max(_ctrl.difficulty, 1)); firing = false; }
        break;
}