//Player movement
var move = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
hsp = move * wsp;

vsp += grav;

//jump
if (place_meeting(x , y+1, o_TarzanWal) && keyboard_check_pressed(vk_space))
{
vsp = jpow;
}

//Collision
//horizontal
if (place_meeting(x + hsp, y, o_TarzanWal))
{
    while (!place_meeting(x + sign(hsp), y, o_TarzanWal))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;
//vertical
if (place_meeting(x, y+vsp, o_TarzanWal))
{
    while (!place_meeting(x, y + sign(vsp), o_TarzanWal))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

//animations

if (move != 0)
{
    image_xscale = sign(move);
}

// Animation
if (!place_meeting(x, y + 1, o_TarzanWal))
{
    if (vsp < 0)
    {
        sprite_index = s_Tarzan_jump;
    }
    else
    {
        sprite_index = s_Tarzan_fall;
    }
}
else if (move != 0)
{
    sprite_index = s_Tarzan_walk;
}
else
{
    sprite_index = s_Tarzans_Idle;
}