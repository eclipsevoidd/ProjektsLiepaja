// 1. INPUTS
var _input_x = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));

// 2. MOVEMENT LOGIC
if (!is_shooting) {
    hsp = _input_x * walk_speed;
    x += hsp;
    
    // Flip character sprite based on direction
    // Using -sign(hsp) because your sprite faces Left by default
    if (hsp != 0) image_xscale = -sign(hsp); 
} else {
    hsp = 0; 
}

// 3. SHOOTING LOGIC
if (has_ball && keyboard_check_pressed(ord("E"))) {
    is_shooting = true;
    shot_value = 0;
}

if (is_shooting) {
    shot_value += 2.5; 

    if (keyboard_check_released(ord("E"))) {
        is_shooting = false;
        has_ball = false;
        
        // Spawn the ball
        var ball = instance_create_layer(x, y - 16, "Instances", o_Ball);
        
        // Use -image_xscale to match your inverted flip logic
        var _dir = -image_xscale; 

        if (shot_value >= 75 && shot_value <= 85) { // Green Zone
            ball.hspeed = 8 * _dir; 
            ball.vspeed = -15;
        } else if (shot_value < 75) { // Early
            ball.hspeed = 5 * _dir;
            ball.vspeed = -12;
        } else { // Late
            ball.hspeed = 11 * _dir;
            ball.vspeed = -13;
        }
    }
}

// 4. ANIMATION PICKER (Cleaned up)
if (is_shooting) {
    sprite_index = s_shoot;
    // Freeze on the last frame of the jump until released
    if (image_index >= image_number - 1) image_speed = 0; 
} 
else {
    image_speed = 1;
    if (has_ball) {
        if (hsp != 0) sprite_index = s_dribble;
        else sprite_index = s_idle_ball;
    } 
    else {
        if (hsp != 0) sprite_index = s_walk;
        else sprite_index = s_idle;
    }
}