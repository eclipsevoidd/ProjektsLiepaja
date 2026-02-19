if (o_QuestionPanel.panelOpen == true && o_QuestionPanel.animate == false) {
    
    var _correctID = global.correctAnswers[global.current_index];

    if (button_id == _correctID) {
        audio_play_sound(snd_correct, 1, false); 
        image_blend = c_lime;
    } else {
        // WRONG
        audio_play_sound(snd_wrong, 1, false);
        image_blend = c_red;
    }

    with(o_QuestionPanel) {
        animate = true;
    }
}