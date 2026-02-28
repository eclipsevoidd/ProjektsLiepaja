is_locked = (level > global.playerProgression);

if (position_meeting(mouse_x, mouse_y, id) && !is_locked && !instance_exists(o_FadeObject)) {
    hover_alpha = lerp(hover_alpha, 1.0, 0.15);
    
    if (mouse_check_button_pressed(mb_left)) {
        // Get the data for THIS button's level
        var _data = get_level_data(level);
        
        // Transition to the unique room name
        fadeToRoom(_data.target_room, 0.5, 1);
		audio_stop_all();
    }
} else {
    hover_alpha = lerp(hover_alpha, 0, 0.15);
}