// Grab check
if (!has_player && !instance_exists(o_TARZANSsWin))
{
    if (point_distance(o_TARZANSsPlayer.x, o_TARZANSsPlayer.y, rope_anchor_x, rope_anchor_y) < 24)
    {
        has_player = true;
        o_TARZANSsPlayer.quiz_active = true;
        o_TARZANSsPlayer.hsp = 0;
        o_TARZANSsPlayer.vsp = 0;
        slide_progress = 0;
    }
}

// Slide along zipline
if (has_player)
{
    slide_progress += slide_speed;
    
    o_TARZANSsPlayer.x = lerp(rope_anchor_x, rope_end_x, slide_progress);
    o_TARZANSsPlayer.y = lerp(rope_anchor_y, rope_end_y, slide_progress);
    o_TARZANSsPlayer.hsp = 0;
    o_TARZANSsPlayer.vsp = 0;
    
    // Reached the end
    if (slide_progress >= 1)
    {
        has_player = false;
        if (!instance_exists(o_TARZANSsWin))
        {
            instance_create_layer(0, 0, "Instances", o_TARZANSsWin);
        }
    }
}