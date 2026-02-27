// --- Input ---
var move = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));

// --- Don't move during quiz ---
if (quiz_active) exit;

// --- Speeds ---
hsp = move * wsp;
vsp += grav;

// --- Facing direction ---
if (move != 0) facing = sign(move);

// --- Dash ---
if (keyboard_check_pressed(ord("E")) && dash_timer == 0 && dash_cd == 0)
{
    dash_timer = dash_dur;
    dash_cd = dash_cd_max;
}

if (dash_timer > 0)
{
    hsp = dash_spd * facing;
    vsp = 0;
    dash_timer--;
}

if (dash_cd > 0) dash_cd--;

// --- Jump (skip if on rope) ---
if (!(instance_exists(o_TarzansRope) && o_TarzansRope.has_player))
{
    if (place_meeting(x, y + 1, o_TarzanWal) && keyboard_check_pressed(vk_space))
    {
        vsp = jpow;
    }
}

// --- Horizontal collision ---
if (place_meeting(x + hsp, y, o_TarzanWal))
{
    while (!place_meeting(x + sign(hsp), y, o_TarzanWal))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// --- Vertical collision ---
if (place_meeting(x, y + vsp, o_TarzanWal))
{
    while (!place_meeting(x, y + sign(vsp), o_TarzanWal))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// --- Sprite flipping ---
if (move != 0) image_xscale = sign(move);

// --- Animation ---
if (dash_timer > 0)
{
    sprite_index = s_Tarzans_Dash;
}
else if (!place_meeting(x, y + 1, o_TarzanWal))
{
    if (vsp < 0)
        sprite_index = s_Tarzan_jump;
    else
        sprite_index = s_Tarzan_fall;
}
else if (move != 0)
{
    sprite_index = s_Tarzan_walk;
}
else
{
    sprite_index = s_Tarzans_Idle;
}