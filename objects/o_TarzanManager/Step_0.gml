
if (game_state == "MENU") {
    // Freeze player
    if (instance_exists(o_tarzansPlayer)) {
        o_tarzansPlayer.quiz_active = true;
    }
    exit;
}