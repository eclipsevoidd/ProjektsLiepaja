 if (global.state == quizState.Game) {
	 if (!audio_is_playing(snd_quizionaire)) {
		 audio_play_sound(snd_quizionaire, 0, false, 0.5);
	 }
	spawn_timer++;
}

if (spawn_timer >= spawn_delay) {
    spawn_timer = 0;
    
    var _is_left_to_right = (line_number % 2 == 0);
    var _x_offset = 75 + (line_number % 2) * 250;
    
    if (_is_left_to_right) {
        for (var _x = _x_offset; _x < room_width + 200; _x += 500) {
            var _qmark = instance_create_depth(_x, -150, -1, o_QMark);
            _qmark.move_speed_x = 0;
            _qmark.move_speed_y = 4;
        }
    } else {
        for (var _x = _x_offset; _x < room_width + 200; _x += 500) {
            var _qmark = instance_create_depth(_x, room_height + 150, -1, o_QMark);
            _qmark.move_speed_x = 0;
            _qmark.move_speed_y = -4;
			_qmark.image_angle = 180;
        }
    }
    
    line_number++;
}