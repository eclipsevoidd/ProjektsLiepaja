if (keyboard_check_pressed(ord("R")))
{
    scr_submit_score(GAME.TARZAN, 100)
    
    room_restart();
    instance_destroy();
}