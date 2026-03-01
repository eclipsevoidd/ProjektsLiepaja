if (keyboard_check_pressed(vk_tab)) {
    if (!has_been_used) {
        if (!move_to_target) {
            move_to_target = true;
            global.popup_active = true;
        } else {
            move_to_target = false;
            has_been_used = true;
            global.popup_active = false;
        }
    }
}

var curr_target_x = move_to_target ? target_x_manual : orig_x;
var curr_target_y = move_to_target ? target_y_manual : orig_y;


x = lerp(x, curr_target_x, lerp_speed);
y = lerp(y, curr_target_y, lerp_speed);