var _ctrl = instance_find(o_Game_Controller, 0);
if (!instance_exists(_ctrl) || !_ctrl.game_active) exit;

// Timers
if (stunned) { stun_timer -= 1; if (stun_timer <= 0) { stunned = false; invincible = true; invincible_timer = 60; } }
if (invincible) { invincible_timer -= 1; if (invincible_timer <= 0) invincible = false; }
if (boosted) { boost_timer -= 1; if (boost_timer <= 0) boosted = false; }

// --- Ring opening definition ---
// The opening faces UP = 90 degrees in GameMaker
// Allow passage within ±20 degrees of the opening
var _opening_angle = 90;
var _opening_half_width = 20;

// Check if player's angle is within the opening
var _angle_diff_to_opening = abs(angle_difference(angle_pos, _opening_angle));
var _in_opening = (_angle_diff_to_opening <= _opening_half_width);

// Current zone
in_center = (radius_pos < _ctrl.pool_r_center);
var _in_ring_zone = (radius_pos >= _ctrl.pool_r_center && radius_pos <= _ctrl.pool_r_inner + 10);

// Current push (weaker in center)
var _current = in_center ? _ctrl.current_speed * 0.3 : _ctrl.current_speed;
var _bm = boosted ? 1.5 : 1;

// Current always pushes clockwise
angle_pos += _current * _bm;
if (angle_pos >= 360) angle_pos -= 360;

// --- Input: absolute screen directions ---
var _input_x = 0;
var _input_y = 0;

if (!stunned) {
    if (keyboard_check(vk_up) || keyboard_check(ord("W")))    _input_y = -1;
    if (keyboard_check(vk_down) || keyboard_check(ord("S")))  _input_y = 1;
    if (keyboard_check(vk_left) || keyboard_check(ord("A")))  _input_x = -1;
    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) _input_x = 1;
}

// Save old position for wall collision
var _old_angle = angle_pos;
var _old_radius = radius_pos;

if (_input_x != 0 || _input_y != 0) {
    // Normalize
    var _input_len = sqrt(_input_x * _input_x + _input_y * _input_y);
    _input_x /= _input_len;
    _input_y /= _input_len;
    
    // Current world position
    var _wx = _ctrl.pool_cx + lengthdir_x(radius_pos, angle_pos);
    var _wy = _ctrl.pool_cy + lengthdir_y(radius_pos, angle_pos);
    
    // Move in screen direction
    var _speed = steer_speed * _bm;
    var _new_wx = _wx + _input_x * _speed;
    var _new_wy = _wy + _input_y * _speed;
    
    // Convert back to polar
    angle_pos = point_direction(_ctrl.pool_cx, _ctrl.pool_cy, _new_wx, _new_wy);
    radius_pos = point_distance(_ctrl.pool_cx, _ctrl.pool_cy, _new_wx, _new_wy);
}

// --- Clamp to pool outer wall ---
radius_pos = clamp(radius_pos, 0, _ctrl.pool_r_outer - 20);

// --- Bronze ring wall collision ---
// The ring is a wall between pool_r_center and pool_r_inner
// You can only pass through if you're at the opening angle

var _new_angle_diff = abs(angle_difference(angle_pos, _opening_angle));
var _now_in_opening = (_new_angle_diff <= _opening_half_width);

// Were we outside the ring (in the swimming channel)?
var _was_outside = (_old_radius > _ctrl.pool_r_inner + 10);
// Were we inside the ring (in the center)?
var _was_inside = (_old_radius < _ctrl.pool_r_center);

// Trying to enter the ring zone from outside
if (_was_outside && radius_pos <= _ctrl.pool_r_inner + 10) {
    if (!_now_in_opening) {
        // BLOCKED — push back outside the ring
        radius_pos = _ctrl.pool_r_inner + 12;
    }
}

// Trying to exit the center outward through the ring
if (_was_inside && radius_pos >= _ctrl.pool_r_center) {
    if (!_now_in_opening) {
        // BLOCKED — push back inside
        radius_pos = _ctrl.pool_r_center - 2;
    }
}

// If in the ring zone (between center and inner) but NOT at opening, push to nearest side
if (radius_pos >= _ctrl.pool_r_center && radius_pos <= _ctrl.pool_r_inner + 10) {
    if (!_now_in_opening) {
        // Decide which side to push to based on where we came from
        if (_was_outside || _old_radius > (_ctrl.pool_r_center + _ctrl.pool_r_inner) / 2) {
            radius_pos = _ctrl.pool_r_inner + 12;
        } else {
            radius_pos = _ctrl.pool_r_center - 2;
        }
    }
}

// Final safety clamp
if (radius_pos < 15) radius_pos = 15;

// Update world position
x = _ctrl.pool_cx + lengthdir_x(radius_pos, angle_pos);
y = _ctrl.pool_cy + lengthdir_y(radius_pos, angle_pos);

// --- Collisions (same as before) ---
if (!stunned && !invincible && !in_center) {
    with (o_Swimmer) {
        if (point_distance(other.x, other.y, x, y) < other.col_radius + 16) {
            audio_play_sound(snd_Stunned, 10, false);
            other.stunned = true; 
            other.stun_timer = 60; 
            _ctrl.score_total -= 10; 
            break;
        }
    }
}
if (!stunned && !invincible) {
    with (o_Jet) {
        if (firing) {
            if (abs(angle_difference(other.angle_pos, jet_angle)) < 6) {
                var _tot = _ctrl.pool_r_outer - _ctrl.pool_r_inner;
                var _reach = _ctrl.pool_r_outer - stream_progress * _tot;
                if (other.radius_pos <= _ctrl.pool_r_outer - 8 && other.radius_pos >= _reach - 15) {
                    audio_play_sound(snd_Stunned, 10, false);
                    other.stunned = true; 
                    other.stun_timer = 75; 
                    _ctrl.score_total -= 20; 
                    break;
                }
            }
        }
    }
}
with (o_Coin) { 
	if (point_distance(other.x, other.y, x, y) < other.col_radius + 12) {
		audio_play_sound(snd_coin, 10, false);
		_ctrl.score_total += 5; instance_destroy(); 
		} 
	}
with (o_Duck) { if (point_distance(other.x, other.y, x, y) < other.col_radius + 14) { _ctrl.score_total += 5;audio_play_sound(snd_RubberDucky,1, false); instance_destroy(); } }
with (o_Speed_Ring) { if (point_distance(other.x, other.y, x, y) < other.col_radius + 16) { _ctrl.score_total += 5; other.boosted = true; other.boost_timer = 120; instance_destroy(); } }
