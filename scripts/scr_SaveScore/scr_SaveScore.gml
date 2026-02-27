function scr_SaveScore(){
	var json_string = json_stringify(global.minigames);

    var file = file_text_open_write("minigame_scores.json");
    file_text_write_string(file, json_string);
    file_text_close(file);
}