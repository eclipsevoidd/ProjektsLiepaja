if (global.state == quizState.Game && !audio_is_playing(global.quizMusic)) {
    global.quizMusic = audio_play_sound(snd_quizionaire, 10, true);
    audio_sound_gain(global.quizMusic, global.musicVolume, 0);
}

if (global.state == quizState.Game && global.timerActive) {
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
        fadeToRoom(rm_MainMenu, 0.5, 1);
    }
}