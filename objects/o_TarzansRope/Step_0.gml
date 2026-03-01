// Grab check
if (grab_cooldown > 0) grab_cooldown--;

if (!has_player && grab_cooldown == 0)
{
    var end_x = rope_anchor_x + lengthdir_x(rope_length, rope_angle - 90);
    var end_y = rope_anchor_y + lengthdir_y(rope_length, rope_angle - 90);
    
    if (point_distance(o_tarzansPlayer.x, o_tarzansPlayer.y, end_x, end_y) < 24)
    {
        has_player = true;
        rope_speed = o_tarzansPlayer.hsp * 0.3;
    }
}

// Swing physics
rope_speed += -rope_gravity * dsin(rope_angle);
rope_speed *= rope_friction;
rope_angle += rope_speed;

if (has_player)
{
    o_tarzansPlayer.x = rope_anchor_x + lengthdir_x(rope_length, rope_angle - 90);
    o_tarzansPlayer.y = rope_anchor_y + lengthdir_y(rope_length, rope_angle - 90);
    o_tarzansPlayer.hsp = 0;
    o_tarzansPlayer.vsp = 0;
    
    var push = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
    rope_speed += push * 0.15;
    
    if (keyboard_check_pressed(vk_space))
	{
	    has_player = false;
	    grab_cooldown = 30;  // half a second before it can grab again
	    o_tarzansPlayer.hsp = lengthdir_x(rope_speed * 4, rope_angle - 90) + o_tarzansPlayer.facing * 3;
	    o_tarzansPlayer.vsp = -6;
	}
}