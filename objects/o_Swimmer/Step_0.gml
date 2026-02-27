var _ctrl = instance_find(o_Game_Controller, 0);

if (!instance_exists(_ctrl) || !_ctrl.game_active) exit;
angle_pos += spd;

if (angle_pos >= 360) angle_pos -= 360;
wobble_offset += wobble_speed;

var _w = sin(degtorad(wobble_offset)) * wobble_amount;
var _r = clamp(radius_pos + _w, _ctrl.pool_r_inner + 20, _ctrl.pool_r_outer - 20);

x = _ctrl.pool_cx + lengthdir_x(_r, angle_pos);
y = _ctrl.pool_cy + lengthdir_y(_r, angle_pos);