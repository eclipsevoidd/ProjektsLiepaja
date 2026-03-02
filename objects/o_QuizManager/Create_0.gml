randomize();

countdown_timer = 4;
last_number_played = 4; 
global.quizMusic = -1;

texture_prefetch(s_PlusOne);

global.sprite_map = ds_map_create();
ds_map_add(global.sprite_map, "s_Tilts", s_Tilts);
ds_map_add(global.sprite_map, "s_Dzintars", s_Dzintars);
ds_map_add(global.sprite_map, "s_LOC", s_LOC);
// kā pievienot jaunu bildi:
// ds_map_add(global.sprite_map, "s_Bilde", s_Bilde);

var _filename = "quiz_data.json";
var _loadedData = load_quiz_data(_filename);
global.quizJautajumi = [];
global.quizOptions = [];
global.correctAnswers = [];
global.quizBildes = [];

// json parse
for (var i = 0; i < array_length(_loadedData); i++) {
    array_push(global.quizJautajumi, _loadedData[i].question);
    array_push(global.quizOptions, _loadedData[i].options);
    array_push(global.correctAnswers, _loadedData[i].answer);
    
    var _spriteName = _loadedData[i].image;
    var _spriteIndex = -1;
    
    if (ds_map_exists(global.sprite_map, _spriteName)) {
        _spriteIndex = global.sprite_map[? _spriteName];
    }
    
    array_push(global.quizBildes, _spriteIndex);
}

// random jautajumi
global.question_pool = ds_list_create();
for (var i = 0; i < array_length(global.quizJautajumi); i++) {
    ds_list_add(global.question_pool, i);
}
ds_list_shuffle(global.question_pool);
global.pool_index = 0;
global.current_index = global.question_pool[| global.pool_index];
global.jautajums = global.quizJautajumi[global.current_index];
global.state = quizState.Game;
global.panel_alpha = 1;

// taimera iestatījumi
global.maxTime = 104;
global.currentTime = global.maxTime;
global.timerActive = true;
global.transitionStarted = false;
global.musicVolume = 0.5;