if (file_exists("save_data.ini")) {
    ini_open("save_data.ini");
    global.currentLevel = ini_read_real("Progress", "level", 0);
    ini_close();
}

if (file_exists("savedata.json")) {
    var _f = file_text_open_read("savedata.json");
    var _str = file_text_read_string(_f);
    file_text_close(_f);
    global.checkFirstTime = json_parse(_str);
} else {
    global.checkFirstTime = array_create(GAME.COUNT, false);
}

audio_stop_all();
audio_play_sound(snd_bg, 0, true, 0.5);