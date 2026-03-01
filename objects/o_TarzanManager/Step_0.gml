if (!audio_is_playing(snd_AmbienceWind)) {
        audio_play_sound(snd_AmbienceWind, 10, true); 
    }

if (game_state == "MENU") {
    // Freeze player
    if (instance_exists(o_tarzansPlayer)) {
        o_tarzansPlayer.quiz_active = true;
    }
    exit;
}