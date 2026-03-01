if (!instance_exists(o_TarzanDeath))
{
    o_tarzansPlayer.quiz_active = true;
    o_tarzansPlayer.hsp = 0;
    o_tarzansPlayer.vsp = 0;
    instance_create_layer(0, 0, "Instances", o_TarzanDeath);
}