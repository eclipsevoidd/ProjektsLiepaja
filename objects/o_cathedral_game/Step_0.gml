/// @desc Galvena logika

switch (state) {

    case 0:
        if (keyboard_check_pressed(vk_enter)) {
            state = 1;
            points = 0;
            time_remaining = time_total * 60;
            marker_y = bar_y + bar_height / 2;
            marker_vel = 0;
            music_playing = false;
        }
        break;

    case 1:

        // --- Laiks ---
        time_remaining -= 1;
        if (time_remaining <= 0) {
            time_remaining = 0;
            state = 2;
            // Apturet muzikas
            if (music_playing) {
                audio_pause_sound(snd_organ);
                music_playing = false;
            }
            if (audio_exists(snd_success)) {
                audio_play_sound(snd_success, 10, false);
            }
            break;
        }

        // --- Markiera fizika ---
        marker_vel += marker_grav;

        if (keyboard_check(vk_space)) {
            marker_vel += marker_lift;
        }

        marker_vel = clamp(marker_vel, -marker_max_spd, marker_max_spd);
        marker_y += marker_vel;

        if (marker_y < bar_y) {
            marker_y = bar_y;
            marker_vel = 0;
        }
        if (marker_y > bar_y + bar_height - marker_height) {
            marker_y = bar_y + bar_height - marker_height;
            marker_vel = 0;
        }

        // --- Zalas zonas kustiba ---
        green_y += green_speed * green_dir;

        if (green_y <= bar_y) {
            green_dir = 1;
            green_speed = 0.6 + random(1.4);
        }
        if (green_y >= bar_y + bar_height - green_height) {
            green_dir = -1;
            green_speed = 0.6 + random(1.4);
        }

        // --- Parlaudit vai zalaja zona ---
        var _mc = marker_y + marker_height / 2;
        var _in_green = (_mc >= green_y) && (_mc <= green_y + green_height);

        // --- Punkti + Muzika ---
        if (_in_green) {
            points += point_speed;

            // Sakt muzikas ja vel nespele
            if (!music_playing) {
                if (audio_is_paused(snd_organ)) {
                    audio_resume_sound(snd_organ);
                } else {
                    audio_play_sound(snd_organ, 1, true);
                    audio_sound_gain(snd_organ, 0.5, 0);
                }
                music_playing = true;
            }
        } else {
            // Pauzet muzikas
            if (music_playing) {
                audio_pause_sound(snd_organ);
                music_playing = false;
            }
        }

        points = clamp(points, 0, max_points);

        // Ja sasniedz max
        if (points >= max_points) {
            points = max_points;
            state = 2;
            if (music_playing) {
                audio_pause_sound(snd_organ);
                music_playing = false;
            }
            if (audio_exists(snd_success)) {
                audio_play_sound(snd_success, 10, false);
            }
        }

        break;

    case 2:
        if (keyboard_check_pressed(vk_enter)) {
            audio_stop_sound(snd_organ);

            scr_submit_score(GAME.CATHEDRAL, floor(points));

            show_message("Punkti: " + string(floor(points)) + " / " + string(max_points));
			
			
			//Teleprotēšana uz outro
			fadeToRoom(rm_KatedraleOutro, 1, 1);
        }
        break;
}