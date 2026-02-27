var _ctrl = instance_find(o_Game_Controller, 0);
angle_pos = 0;
radius_pos = (_ctrl.pool_r_inner + _ctrl.pool_r_outer) / 2;
move_speed = 0;
boosted = false;
boost_timer = 0;
stunned = false;
stun_timer = 0;
invincible = false;
invincible_timer = 0;
col_radius = 18;
in_center = false;

// Movement speed for screen-direction input
steer_speed = 2.5;