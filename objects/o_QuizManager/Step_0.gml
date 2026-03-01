if (global.state == quizState.Intro) {
    var _dt = delta_time / 1000000;
    countdown_timer -= _dt;
	
	var _current_num = ceil(countdown_timer);
    
    if (_current_num < last_number_played) {
        if (_current_num > 0 && _current_num <= 3) {
            audio_play_sound(snd_blip, 10, false);
        }
        last_number_played = _current_num;
    }
    
    if (countdown_timer <= 0) {
        global.state = quizState.Game;
        
        global.current_index = global.question_pool[| global.pool_index];
        global.jautajums = global.quizJautajumi[global.current_index];

        with(o_QuestionPanel) {
            animate = true;
        }
    }
}

if (global.state == quizState.Game && !audio_is_playing(global.quizMusic)) {
    global.quizMusic = audio_play_sound(snd_quizionaire, 10, true);
    audio_sound_gain(global.quizMusic, global.musicVolume, 0);
}

if (global.state == quizState.Game && global.timerActive) {
	if (!instance_exists(o_PunktiText)) {
		instance_create_depth(x, y, 0, o_PunktiText);
	}
    var _dt = delta_time / 1000000;
    global.currentTime -= _dt;

    if (global.currentTime <= 0) {
        global.currentTime = 0;
        global.timerActive = false;
        
        global.state = quizState.End;
        
        with(o_QuestionPanel) {
            animate = true;
        }
    }
}

if (global.state == quizState.End) {
    var _fade_speed = 1 - power(0.01, delta_time / 1000000); 
    global.musicVolume = lerp(global.musicVolume, 0, _fade_speed);
    
    audio_sound_gain(global.quizMusic, global.musicVolume, 0);

   if (global.musicVolume <= 0.01 && !global.transitionStarted) {
        audio_stop_sound(global.quizMusic);
        
        global.transitionStarted = true;
        fadeToRoom(rm_LiepajasQuizOutro, 1, 1);
    }
}