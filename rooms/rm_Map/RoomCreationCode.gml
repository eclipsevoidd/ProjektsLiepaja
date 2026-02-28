global.playerProgression = 0;
if (file_exists("save_data.ini")) {
    ini_open("save_data.ini");
    global.playerProgression = ini_read_real("Progress", "level", 0);
    ini_close();
}

audio_stop_all();
audio_play_sound(snd_bg, 0, true, 0.5);