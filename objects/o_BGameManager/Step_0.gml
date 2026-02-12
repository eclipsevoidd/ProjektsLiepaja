// --- 1. SPAWNING & ACTIVATION ---
if (keyboard_check_pressed(ord("2"))) {
    if (!instance_exists(o_Enemy)) {
        // Spawn Enemy on the LEFT side
        instance_create_layer(100, 350, "Instances", o_Enemy); 
    }
    
    // Set positions for the start of the match
    o_Player.x = room_width / 2 + 150; // Player on the RIGHT
    o_Player.has_ball = false;
    
    if (instance_exists(o_Enemy)) {
        o_Enemy.x = room_width / 2 - 150; // NPC on the LEFT
        o_Enemy.has_ball = false;
    }
    
    global.game_state = "COUNTDOWN";
    global.countdown = 120; 
}

// --- 2. COUNTDOWN STATE ---
if (global.game_state == "COUNTDOWN") {
    // Keep them locked in place so they don't drift during the 3-2-1
    o_Player.x = room_width / 2 + 150;
    if (instance_exists(o_Enemy)) o_Enemy.x = room_width / 2 - 150;
    
    global.countdown--;
    
    if (global.countdown <= 0) {
        global.game_state = "MINIGAME";
        global.mini_timer = 60; 
        global.mini_key = choose("W", "A", "S", "D");
    }
}

// --- 3. TIP-OFF MINI-GAME LOGIC ---
if (global.game_state == "MINIGAME") {
    // Keep them locked during the key-press prompt too
    o_Player.x = room_width / 2 + 150;
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
            global.game_state = "PLAYING";
        } else {
            if (instance_exists(o_Enemy)) o_Enemy.has_ball = true;
            global.game_state = "PLAYING";
        }
    }

    if (global.mini_timer <= 0) {
        if (instance_exists(o_Enemy)) o_Enemy.has_ball = true;
        global.game_state = "PLAYING";
    }
}

// --- NEW: WAIT AFTER SCORING ---
if (global.game_state == "POST_SCORE") {
    // Extra safety: if enemy is gone, go back to playing immediately
    if (!instance_exists(o_Enemy)) {
        global.game_state = "PLAYING";
        exit;
    }

    global.score_delay--;

    if (global.score_delay <= 0) {
        if (instance_exists(o_Ball)) instance_destroy(o_Ball);

        // Teleport to match positions
        o_Player.x = room_width / 2 + 150;
        o_Player.has_ball = false;
        
        o_Enemy.x = room_width / 2 - 150;
        o_Enemy.has_ball = false;

        global.game_state = "COUNTDOWN";
        global.countdown = 120; 
    }
}