
if (!scored) {
    scored = true;

    // 1. CREATE VISUAL EFFECT
    instance_create_layer(other.x, other.y, "Instances", o_ScoreEffect);

    hsp = 0;
    vsp = 2;

    // 3. STOP NPC BEHAVIOR

    if (instance_exists(o_Enemy)) {
        o_Enemy.has_ball = false;
        o_Enemy.is_shooting = false;
        o_Enemy.hsp = 0;
        o_Enemy.vsp = 0;
    }

    // 4. DETERMINE GAME FLOW (Practice vs Match)
    if (instance_exists(o_Enemy)) {
        global.game_state = "POST_SCORE";
        global.score_delay = 90; 
    } else {
        // --- PRACTICE MODE ---

        global.game_state = "PLAYING";
        alarm[0] = 60; 
    }
}