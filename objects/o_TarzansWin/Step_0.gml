if (keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
    if (instance_exists(o_TarzanManager)) {
    }
    fadeToRoom(rm_TarzansOutro, 1, 1);
}