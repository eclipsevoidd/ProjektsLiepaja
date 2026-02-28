
global.player_name = "Player"; 


enum GAME {
    BASKETBALL,     // 0 - Basketboll
    DRIFT,          // 1 - DriftArena
    FORT_SHOOTER,   // 2 - ZiemeluForti
    CONCERT,        // 3 - rm_ConcerHall
    CATHEDRAL,      // 4 - rm_Katedrals
    POOL,           // 5 - rm_pool
    TARZAN,         // 6 - rm_Tarzans
    QUIZ,           // 7 - rm_LiepajaQuiz
    COUNT           // Always last – total number of games
}

global.game_names[GAME.BASKETBALL]   = "Basketbols";
global.game_names[GAME.DRIFT]        = "Drifts";
global.game_names[GAME.FORT_SHOOTER] = "Ziemeļu Forti";
global.game_names[GAME.CONCERT]      = "Koncerts";
global.game_names[GAME.CATHEDRAL]    = "Katedrāle";
global.game_names[GAME.POOL]         = "Baseins";
global.game_names[GAME.TARZAN]       = "Tarzāns";
global.game_names[GAME.QUIZ]         = "Viktorīna";

// Max possible score per game (for normalization / star rating)
global.game_max[GAME.BASKETBALL]   = 100;   // e.g. points scored in match
global.game_max[GAME.DRIFT]        = 100;  // starts at 100, loses points
global.game_max[GAME.FORT_SHOOTER] = 200;  // shooting score
global.game_max[GAME.CONCERT]      = 200;  // note hits
global.game_max[GAME.CATHEDRAL]    = 100;  // organ minigame
global.game_max[GAME.POOL]         = 200;  // pool coins/swimmers
global.game_max[GAME.TARZAN]       = 100;  // completion bonus
global.game_max[GAME.QUIZ]         = 100;  // quiz correct answers

// Current player scores (-1 = not played)
for (var i = 0; i < GAME.COUNT; i++) {
    global.scores[i] = -1;
}


global.leaderboard = [];

// =============================================
// HELPER: Call this from any minigame when it ends
// Example:  scr_submit_score(GAME.BASKETBALL, 7);
// =============================================
// (See the script file scr_submit_score)

global.playTime = 0;
global.isRunning = false;
