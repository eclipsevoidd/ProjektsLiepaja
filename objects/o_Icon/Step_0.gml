if (!instance_exists(o_FadeObject)) {
	if (endedAnimation == false) {
		image_speed = 1.25;
		
		if (!audio_is_playing(snd_jump)) {
			audio_play_sound(snd_jump, 0, 0, 0.25);
			
		}
		endedAnimation = true;
	}
}