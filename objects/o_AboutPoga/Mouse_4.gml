if (!instance_exists(o_AboutPanel)) {
    instance_create_depth(0, 0, -10, o_AboutPanel);
} else {
    with (o_AboutPanel) {
        target_x = offscreen_x;
        closing = true;
    }
}

if (!audio_is_playing(snd_select)) {
	audio_play_sound(snd_select, 0, false, 0.2);
}