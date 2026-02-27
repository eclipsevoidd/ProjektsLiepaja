var lerp_speed = 0.1;  
var target_x_manual = 960;  
var target_y_manual = 50;  


if (!variable_instance_exists(id, "orig_x")) {
    orig_x = x;
    orig_y = y;
    move_to_target = false; 
}


if (keyboard_check_pressed(vk_tab)) {
    move_to_target = !move_to_target;
	o_LiepajasRASPlayer.canMove = !o_LiepajasRASPlayer.canMove;
}


var target_x = move_to_target ? target_x_manual : orig_x;
var target_y = move_to_target ? target_y_manual : orig_y;


x = lerp(x, target_x, lerp_speed);
y = lerp(y, target_y, lerp_speed);