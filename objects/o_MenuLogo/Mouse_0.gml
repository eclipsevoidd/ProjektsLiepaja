if (!audio_is_playing(snd_metalhit) && mouse_check_button_pressed(mb_any))
	audio_play_sound(snd_metalhit, 0, 0, 0.25, 0, 0.75);