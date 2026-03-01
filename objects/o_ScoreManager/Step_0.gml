if (keyboard_check_pressed(vk_f5)) {
    if (file_exists("savedata.json")) file_delete("savedata.json");
    if (file_exists("save_data.ini")) file_delete("save_data.ini");
    show_debug_message("!!! SAVE DATA WIPED !!!");
    game_restart();
}

// Collaborator timing logic
var _dt = delta_time / 1000000;
if (global.isRunning) {
    global.playTime += _dt;
}