function saveFirstTime() {
    var _save_filename = "savedata.json";
    var _json_string = json_stringify(global.checkFirstTime);

    var _file = file_text_open_write(_save_filename);
    file_text_write_string(_file, _json_string);
    file_text_close(_file);
}

function saveProgress() {
    ini_open("save_data.ini");
    ini_write_real("Progress", "level", global.currentLevel);
    ini_close();
}

function completeMinigame(_level_index) {
    if (_level_index >= 0 && _level_index < array_length(global.checkFirstTime)) {
        
        global.can_retry_level = _level_index;
        
        if (global.checkFirstTime[_level_index] == false) {
            global.currentLevel += 1;
            global.checkFirstTime[_level_index] = true;
            
            saveProgress();
            saveFirstTime();
            
            show_debug_message("Līmenis iziets, dati saglabāti");
        } else {
            show_debug_message("Līmenis jau iepriekš iziets.");
        }
    }
}