image_index = 7;
image_speed = 0;
call_later(2, time_source_units_seconds, function() {
        fadeToRoom(rm_MainMenu, 1, 1);
    });