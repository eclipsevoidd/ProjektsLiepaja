if (global.game_state == "MINIGAME") {
    hsp = 0;
    vsp = 0;
    exit; // Stop all other logic
}

// 0. SAFETY CHECK: Ensure hoop is assigned before running logic
if (my_target_hoop == noone) {
    if (variable_global_exists("hoop_player_target")) {
        my_target_hoop = global.hoop_player_target; // Targets the LEFT hoop
    }
    exit; 
}

// 1. INPUTS
var _input_x = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));


if (has_ball && keyboard_check(ord("Q"))) {
    is_dribbling = true;
    sprite_index = s_player_dribble_ball; 
} else {
    is_dribbling = false;
}

// 2. MOVEMENT LOGIC
if (!is_shooting) {
    hsp = _input_x * walk_speed;
    x += hsp;
    
    // Flip sprite
    if (hsp != 0) image_xscale = -sign(hsp); 
} else {
    hsp = 0; // Stop while aiming
}

// 3. SHOOTING LOGIC
if (has_ball && keyboard_check_pressed(ord("E"))) {
    is_shooting = true;
    shot_value = 0;
}

if (is_shooting) {
    shot_value += shot_speed;
    if (shot_value > 100) shot_value = 100;

    if (keyboard_check_released(ord("E"))) {
        is_shooting = false;
        has_ball = false;
        
        var _spawn_x = x;
        var _spawn_y = y - 40; 
        var ball = instance_create_layer(_spawn_x, _spawn_y, "Instances", o_Ball);
        
        var _target = my_target_hoop; // Aiming for LEFT hoop

        if (instance_exists(_target)) {
            var is_perfect = (shot_value >= perfect_min && shot_value <= perfect_max);
            var orange_min = perfect_min - 10;
            var orange_max = perfect_max + 10;
            var is_orange = (shot_value >= orange_min && shot_value <= orange_max);

            var _dir_to_hoop = sign(_target.x - x); 
            var tx = _target.x - (5 * _dir_to_hoop); 
            var ty = _target.y - 10; 

            var time = 75; 
            var _g = 0.5; 
            var req_hsp = (tx - _spawn_x) / time;
            var _gravity_effect = 0.5 * _g * (time * time);
            var req_vsp = ((ty - _spawn_y) - _gravity_effect) / time;

            if (is_perfect) {
                ball.hsp = req_hsp;
                ball.vsp = req_vsp;
				
				audio_play_sound(snd_GreenGiant, 1, false);
				
            } else if (is_orange) {
                if (choose(true, false)) {
                    ball.hsp = req_hsp;
                    ball.vsp = req_vsp;
                } else {
                    ball.hsp = req_hsp * 0.92;
                    ball.vsp = req_vsp;
                }
            } else {
                var _error = (shot_value < orange_min) ? 0.7 : 1.3;
                ball.hsp = req_hsp * _error;
                ball.vsp = req_vsp * 0.9;
				
				audio_play_sound(snd_FAAAH, 1, false);
				
            }
        }
    }
}

// 4. STEAL LOGIC
if (!has_ball && instance_exists(o_Enemy)) {
    if (o_Enemy.has_ball && point_distance(x, y, o_Enemy.x, o_Enemy.y) < 40) {
        if (keyboard_check_pressed(ord("F"))) {
            o_Enemy.has_ball = false;
            has_ball = true;
            o_Enemy.steal_cooldown = 60; // Give yourself a head start
        }
    }
}

// 5. ANIMATION
if (is_shooting) {
    sprite_index = s_shoot;
} 
else if (is_dribbling) {
    // This now has priority over normal walking!
    sprite_index = s_player_dribble_ball; 
} 
else {
    if (has_ball) {
        sprite_index = (hsp != 0) ? s_dribble : s_idle_ball;
    } else {
        sprite_index = (hsp != 0) ? s_walk : s_idle;
    }
}

