var _ctrl = instance_find(o_Game_Controller, 0);
if (!instance_exists(_ctrl) || !_ctrl.game_active) exit;

angle_pos += spd;
if (angle_pos >= 360) angle_pos -= 360;

x = _ctrl.pool_cx + lengthdir_x(radius_pos, angle_pos);
y = _ctrl.pool_cy + lengthdir_y(radius_pos, angle_pos);