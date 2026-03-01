/// @desc o_ScoreManager Create
// =============================================
// SINGLETON PROTECTION (Fixes the duplicate instance issue)
// =============================================
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}

// =============================================
// PLAYER IDENTITY & ENUMS
// =============================================
global.player_name = "Player"; 

enum GAME {
    KATEDRALE,
    KONCERTZALE,
    SPA,
    LOC,
    RAS,
    CIETUMS,
    TARZANS,
    FORTI,
    RTU,
    QUIZ,
    COUNT // total count
}

// =============================================
// PROGRESS & SAVING INITIALIZATION
// =============================================
global.currentLevel = 0;
global.checkFirstTime = array_create(GAME.COUNT, false);

// 1. Load the Array from JSON
if (file_exists("savedata.json")) {
    var _file = file_text_open_read("savedata.json");
    var _json = "";
    while (!file_text_eof(_file)) {
        _json += file_text_read_string(_file);
        file_text_readln(_file);
    }
    file_text_close(_file);
    
    global.checkFirstTime = json_parse(_json);
    
    // 2. SYNC THE COUNTER (This fixes the 0/11 issue)
    var _beaten_count = 0;
    for (var i = 0; i < array_length(global.checkFirstTime); i++) {
        // Checks if index is true (1)
        if (global.checkFirstTime[i]) {
            _beaten_count++;
        }
    }
    global.currentLevel = _beaten_count;
    
    show_debug_message("SAVE LOADED. Beaten: " + string(global.currentLevel) + " | Array: " + string(global.checkFirstTime));
} else {
    show_debug_message("NO SAVE FOUND: Using default values.");
}

// =============================================
// SCORES & LEADERBOARD
// =============================================
// max possible points
global.game_max[GAME.KATEDRALE] = 10;
global.game_max[GAME.KONCERTZALE] = 100;
global.game_max[GAME.SPA] = 200;
global.game_max[GAME.LOC] = 200;
global.game_max[GAME.RAS] = 100;
global.game_max[GAME.CIETUMS] = 200;
global.game_max[GAME.TARZANS] = 100;
global.game_max[GAME.FORTI] = 100;
global.game_max[GAME.RTU] = 100;
global.game_max[GAME.QUIZ] = 100;

for (var i = 0; i < GAME.COUNT; i++) {
    global.scores[i] = -1;
}

global.leaderboard = [];

// =============================================
// TIMING
// =============================================
global.playTime = 0;
global.isRunning = false;