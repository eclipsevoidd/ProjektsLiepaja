// 1. GET INPUT
var _input_y = (keyboard_check(vk_up) || keyboard_check(ord("W"))) - (keyboard_check(vk_down) || keyboard_check(ord("S")));
var _input_x = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A"))); 

// 2. THE "HEAVY-FLOW" STEERING (Faster when held)
var _steer_dir = (speed_val >= 0) ? 1 : -1; 
if (_input_x != 0) {
    // Ramp builds up at a steady pace
    steer_ramp = lerp(steer_ramp, 1, 0.035); 
} else {
    steer_ramp = 0; 
}

// Starts at 1.0 (heavy) and builds to 3.8 (faster for catching drifts)
var _dynamic_rotation = 1.0 + (steer_ramp * 2.8);
var _turn_amount = _input_x * _dynamic_rotation * _steer_dir;
direction -= _turn_amount;

// BODY ROTATION (Visual swing)
var _spin_tendency = abs(_turn_amount) * (abs(speed_val) / max_speed); 
if (_spin_tendency > 1.0) { 
    image_angle -= _turn_amount * 1.4; 
} else {
    image_angle += angle_difference(direction, image_angle) * 0.06;
}

// 3. ACCELERATION
if (_input_y != 0) {
    speed_val += _input_y * accel;
} else {
    speed_val = lerp(speed_val, 0, 0.015); 
}
speed_val = clamp(speed_val, -3, max_speed);

// 4. HYPER-DRIFT PHYSICS
if (abs(speed_val) > 1) {
    var _angle_diff = angle_difference(image_angle, move_dir);
    var _is_flicking = abs(angle_difference(direction, move_dir)) > 8;
    var _is_powering = keyboard_check(vk_up) || keyboard_check(ord("W"));

    var _target_grip = 0.12; 

    if (_is_flicking && _is_powering) {
        _target_grip = 0.003; 
    } else if (abs(_angle_diff) > 8) {
        _target_grip = 0.006; 
    }

    var _drift_intensity = _target_grip;
    
    // Counter-steer balance
    if (_input_x != 0 && sign(_input_x) == -sign(_angle_diff)) {
        _drift_intensity = 0.045; 
    }
    
    move_dir += angle_difference(image_angle, move_dir) * _drift_intensity;
    
    if (abs(_angle_diff) > 120) {
        speed_val = lerp(speed_val, 0, 0.05);
    }
} else {
    move_dir = image_angle;
}

// 5. MOVEMENT & COLLISION
var _h_move = lengthdir_x(speed_val, move_dir);
var _v_move = lengthdir_y(speed_val, move_dir);

if (place_meeting(x + _h_move, y, o_Wall)) { speed_val *= -0.4; _h_move = 0; }
x += _h_move;
if (place_meeting(x, y + _v_move, o_Wall)) { speed_val *= -0.4; _v_move = 0; }
y += _v_move;

// 7. WIDE DRIFT MARKS
var _is_drifting = abs(angle_difference(image_angle, move_dir)) > 15;

if (_is_drifting && abs(speed_val) > 2) {
    drift_timer++;
    
    // Spawns marks every 2 frames for a "spread" look
    if (drift_timer % 2 == 0) {
        // Track width increased to 22 for a wider, more aggressive look
        var _track_width = 22; 
        
        // Left Track
        instance_create_layer(x + lengthdir_x(_track_width, image_angle + 90), 
                              y + lengthdir_y(_track_width, image_angle + 90), 
                              "Instances", o_DriftMark);
        // Right Track
        instance_create_layer(x + lengthdir_x(_track_width, image_angle - 90), 
                              y + lengthdir_y(_track_width, image_angle - 90), 
                              "Instances", o_DriftMark);
    }
}