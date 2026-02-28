if (keyboard_check_pressed(ord("R")))
{
    scr_submit_score(GAME.TARZANS, 100)
    
    room_restart();
    instance_destroy();
}