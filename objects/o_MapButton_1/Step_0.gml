if (global.paused) exit;
is_locked = (level > global.currentLevel);

var _can_play = (!is_locked && level == global.currentLevel) 
             || (level == global.can_retry_level);
var _completed = (level < global.currentLevel && level != global.can_retry_level);

if (position_meeting(mouse_x, mouse_y, id) && _can_play && !_completed && !instance_exists(o_FadeObject)) {
    hover_alpha = lerp(hover_alpha, 1.0, 0.15);
    
    if (mouse_check_button_pressed(mb_left)) {
        var _data = get_level_data(level);
        global.current_playing_level = level;
        
        // If clicking a NEW level (not retry), lock previous
        if (level != global.can_retry_level) {
            global.can_retry_level = -1;
        }
        
        fadeToRoom(_data.target_room, 0.5, 1);
        audio_stop_all();
    }
} else {
    hover_alpha = lerp(hover_alpha, 0, 0.15);
}