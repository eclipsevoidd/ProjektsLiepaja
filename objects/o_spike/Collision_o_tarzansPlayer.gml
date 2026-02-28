if (!instance_exists(o_TARZANSDeath))
{
    o_TARZANSsPlayer.quiz_active = true;
    o_TARZANSsPlayer.hsp = 0;
    o_TARZANSsPlayer.vsp = 0;
    instance_create_layer(0, 0, "Instances", o_TARZANSDeath);
}