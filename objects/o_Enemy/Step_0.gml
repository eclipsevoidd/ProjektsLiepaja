// Drošības pārbaude — ja nav Player, nedari neko
if (!instance_exists(o_Player)) exit;

if (global.game_state == "MINIGAME") {
    hsp = 0;
    vsp = 0;
    exit; // Stop all other logic
}

// --- 1. THE SAFETY GATE ---
// If the hoops aren't assigned yet, try to find them and EXIT the script
if (my_target_hoop == noone) {
    if (variable_global_exists("hoop_player_target")) {
        my_target_hoop = global.hoop_enemy_target;     // NPC shoots RIGHT
        player_target_hoop = global.hoop_player_target; // NPC defends LEFT
    }
    exit; // Stop running this script for this frame to prevent crashes
}

// --- 1. GAME STATE CHECK ---
// If we just scored, are counting down, or are in the mini-game, stop moving!
if (global.game_state == "POST_SCORE" || global.game_state == "COUNTDOWN" || global.game_state == "MINIGAME") {
    hsp = 0;
    vsp = 0;
    is_shooting = false; // Stop any active shot logic
    exit; // Stop the rest of the NPC brain from running
}

// --- 2. GRAVITY ---
vsp += grav;

// --- 3. AI DECISION MAKING ---
var _dist_to_player = point_distance(x, y, o_Player.x, o_Player.y);

if (o_Player.has_ball) {
    // --- AGGRESSIVE DEFENSE ---
    // Instead of standing by the hoop, the NPC chases the Player's X position
    var _chase_speed = walk_speed * 1.1; // Make him slightly faster when chasing
    var _dir = sign(o_Player.x - x);
    
    // Only move if he isn't already "touching" the player
    if (abs(x - o_Player.x) > 20) {
        hsp = _dir * _chase_speed;
    } else {
        hsp = 0; // He is close enough to steal
    }

    // --- STEAL ATTEMPT ---
    // Increased the steal chance and range slightly
   if (_dist_to_player < 50 && steal_cooldown <= 0 && !o_Player.is_dribbling) {
        if (random(100) < 100) { 
            o_Player.has_ball = false;
            has_ball = true;
            steal_cooldown = 80; 
        }
    }
}
else if (has_ball) {
    // STATE: OFFENSE (Move toward the RIGHT hoop)
    var _dir_to_hoop = sign(my_target_hoop.x - x);
    hsp = _dir_to_hoop * walk_speed;

    // SHOOTING LOGIC
    if (abs(x - my_target_hoop.x) < 150) {
        hsp = 0; // Stop to shoot
        
        var _ball = instance_create_layer(x, y - 40, "Instances", o_Ball);
        
        // AI Math: Perfect trajectory to the Right Hoop
        var time = 70;
        var tx = my_target_hoop.x;
        var ty = my_target_hoop.y - 10;
        
        _ball.hsp = (tx - x) / time;
        var _grav_effect = 0.5 * grav * (time * time);
        _ball.vsp = ((ty - (y - 40)) - _grav_effect) / time;
        
        has_ball = false;
    }
} 
else {
    // CHASE LOOSE BALL
    var _loose_ball = instance_nearest(x, y, o_Ball);
    
    if (instance_exists(_loose_ball)) {
        // 1. Move toward the ball
        hsp = sign(_loose_ball.x - x) * walk_speed;
        
        // 2. THE GRAB: If he is close enough, "pick it up"
        if (point_distance(x, y, _loose_ball.x, _loose_ball.y) < 30) {
            instance_destroy(_loose_ball); // Remove the floor ball
            has_ball = true;               // NPC now has it
            
            // Safety: Make sure the player doesn't think they still have it
            o_Player.has_ball = false; 
        }
    } else {
        hsp = 0; // No ball on court, just wait
    }
}

// --- 4. COLLISIONS & MOVEMENT ---
if (place_meeting(x + hsp, y, o_Solid)) hsp = 0;
x += hsp;

if (place_meeting(x, y + vsp, o_Solid)) {
    while(!place_meeting(x, y + sign(vsp), o_Solid)) y += sign(vsp);
    vsp = 0;
}
y += vsp;

if (steal_cooldown > 0) steal_cooldown--;

// --- 5. ANIMATION STATE PICKER ---

// Priority 1: Shooting
// (We assume the NPC shoots instantly, but if you add a timer, check it here)
if (abs(x - my_target_hoop.x) < 155 && hsp == 0 && !has_ball) {
    sprite_index = s_Enemy_shoot; 
} 
else {
    image_speed = 1; // Ensure animations are playing
    
    if (has_ball) {
        // Priority 2: With Ball (Dribble or Idle with ball)
        if (hsp != 0) {
            sprite_index = s_Enemy_dribbe;
        } else {
            sprite_index = s_Enemy_Idle_ball;
        }
    } 
    else {
        // Priority 3: Without Ball (Walk or Idle)
        if (hsp != 0) {
            sprite_index = s_Enemy_walk;
        } else {
            sprite_index = s_Enemy_Idle;
        }
    }
}

// --- 6. SPRITE FACING FIX ---
// This flips the sprite based on movement direction
if (hsp != 0) {
    // If he looks backwards, change -sign to sign
    image_xscale = -sign(hsp); 
}