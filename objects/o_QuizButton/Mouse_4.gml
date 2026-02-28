if (o_QuestionPanel.panelOpen == true && o_QuestionPanel.animate == false) {
    var _correctID = global.correctAnswers[global.current_index];

    if (button_id == _correctID) {
        audio_play_sound(snd_correct, 1, false); 
        image_blend = c_lime;
        global.punkti++;
        global.textColor = c_lime;
        instance_create_depth(x, y, 0, o_PlusOne);
    } else {
        audio_play_sound(snd_wrong, 1, false);
        image_blend = c_red;
        global.textColor = c_red;
        if (global.punkti > 0) global.punkti--;
    }

    with(o_QuestionPanel) {
        animate = true;
    }
}