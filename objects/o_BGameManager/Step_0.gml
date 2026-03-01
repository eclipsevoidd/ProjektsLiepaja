/// @desc o_BGameManager – STEP

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// --- MENU ---
if (global.game_state == "MENU") {
    // Hover feedback
    var _over_warmup = point_in_rectangle(_mx, _my, btn_warmup_x - btn_hw, btn_warmup_y - btn_hh, btn_warmup_x + btn_hw, btn_warmup_y + btn_hh);
    var _over_start  = point_in_rectangle(_mx, _my, btn_start_x - btn_hw, btn_start_y - btn_hh, btn_start_x + btn_hw, btn_start_y + btn_hh);
    
    btn_warmup_alpha = lerp(btn_warmup_alpha, _over_warmup ? 1.0 : 0.6, 0.12);
    btn_start_alpha  = lerp(btn_start_alpha,  _over_start  ? 1.0 : 0.6, 0.12);
    
    if (mouse_check_button_pressed(mb_left)) {
        if (_over_warmup) {
            if (instance_exists(o_Enemy)) instance_destroy(o_Enemy);
            if (instance_exists(o_Ball)) { with (o_Ball) instance_destroy(); }
            o_Player.has_ball = true;
            global.player_score = 0;
            global.enemy_score  = 0;
            global.game_state = "PRACTICE";
            exit;
        }
        if (_over_start) {
            scr_KATEDRALE_start_match();
            exit;
        }
    }
    exit;
}

// --- PRACTICE ---
if (global.game_state == "PRACTICE") {
    var _gui_w = display_get_gui_width();
    var _go_x = _gui_w - 250;
    var _go_y = 70;
    
    var _over_go = point_in_rectangle(_mx, _my, 
        _go_x - btn_hw * 0.8, _go_y - btn_hh * 0.8, 
        _go_x + btn_hw * 0.8, _go_y + btn_hh * 0.8);
    btn_go_alpha = lerp(btn_go_alpha, _over_go ? 1.0 : 0.6, 0.12);
    
    if (mouse_check_button_pressed(mb_left) && _over_go) {
        if (instance_exists(o_Ball)) { with (o_Ball) instance_destroy(); }
        scr_KATEDRALE_start_match();
    }
    exit;
}

// --- COUNTDOWN ---
if (global.game_state == "COUNTDOWN") {
    o_Player.x = room_width / 2 + 150;
    o_Player.has_ball = false;
    o_Player.hsp = 0;
    if (instance_exists(o_Enemy)) {
        o_Enemy.x = room_width / 2 - 150;
        o_Enemy.has_ball = false;
    }
    
    global.countdown--;
    if (global.countdown <= 0) {
        global.game_state = "MINIGAME";
        global.mini_timer = 60;
        global.mini_key = choose("W", "A", "S", "D");
    }
    exit;
}

// --- TIP-OFF MINIGAME ---
if (global.game_state == "MINIGAME") {
    o_Player.x = room_width / 2 + 150;
    o_Player.hsp = 0;
    if (instance_exists(o_Enemy)) o_Enemy.x = room_width / 2 - 150;

    global.mini_timer--;

    var _pressed = "";
    if (keyboard_check_pressed(ord("W"))) _pressed = "W";
    if (keyboard_check_pressed(ord("A"))) _pressed = "A";
    if (keyboard_check_pressed(ord("S"))) _pressed = "S";
    if (keyboard_check_pressed(ord("D"))) _pressed = "D";

    if (_pressed != "") {
        if (_pressed == global.mini_key) {
            o_Player.has_ball = true;
        } else {
            if (instance_exists(o_Enemy)) o_Enemy.has_ball = true;
        }
        global.game_state = "PLAYING";
    }

    if (global.mini_timer <= 0) {
        if (instance_exists(o_Enemy)) o_Enemy.has_ball = true;
        global.game_state = "PLAYING";
    }
    exit;
}

// --- POST SCORE ---
if (global.game_state == "POST_SCORE") {
    if (!instance_exists(o_Enemy)) {
        global.game_state = "PLAYING";
        exit;
    }

    global.score_delay--;

    if (global.score_delay <= 0) {
        if (instance_exists(o_Ball)) { with (o_Ball) instance_destroy(); }

        if (global.player_score >= global.target_score) {
            global.match_winner = "PLAYER";
            global.game_state = "GAME_OVER";
            exit;
        }
        if (global.enemy_score >= global.target_score) {
            global.match_winner = "ENEMY";
            global.game_state = "GAME_OVER";
            exit;
        }

        o_Player.x = room_width / 2 + 150;
        o_Player.has_ball = false;
        o_Enemy.x = room_width / 2 - 150;
        o_Enemy.has_ball = false;

        global.game_state = "COUNTDOWN";
        global.countdown = 120;
    }
    exit;
}

// --- GAME OVER ---
if (global.game_state == "GAME_OVER") {
    if (keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
		scr_submit_score(GAME.LOC, global.player_score);
		completeMinigame(GAME.LOC);
        fadeToRoom(rm_AfterBasketball, 1, 1);
    }
    exit;
}


/// Helper function
function scr_KATEDRALE_start_match() {
    global.player_score = 0;
    global.enemy_score  = 0;
    global.match_winner = "";
    
    // Iznīcini veco enemy un izveido jaunu
    if (instance_exists(o_Enemy)) instance_destroy(o_Enemy);
    instance_create_layer(100, o_Player.y, "Instances", o_Enemy);
    
    if (instance_exists(o_Ball)) { with (o_Ball) instance_destroy(); }
    
    o_Player.x = room_width / 2 + 150;
    o_Player.has_ball = false;
    if (instance_exists(o_Enemy)) {
        o_Enemy.x = room_width / 2 - 150;
        o_Enemy.y = o_Player.y;
        o_Enemy.has_ball = false;
    }
    
    global.game_state = "COUNTDOWN";
    global.countdown = 120;
}