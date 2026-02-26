if (!scored) {
    scored = true;

    instance_create_layer(other.x, other.y, "Instances", o_ScoreEffect);
    hsp = 0;
    vsp = 2;

    // Award points to the correct team
    if (variable_global_exists("hoop_player_target")) {
        if (other.id == global.hoop_player_target) {
            global.player_score += global.points_per_basket;
        } else if (other.id == global.hoop_enemy_target) {
            global.enemy_score += global.points_per_basket;
        }
    }

    if (instance_exists(o_Enemy)) {
        o_Enemy.has_ball = false;
        o_Enemy.is_shooting = false;
        o_Enemy.hsp = 0;
        o_Enemy.vsp = 0;
    }

    if (global.game_state == "PRACTICE") {
        alarm[0] = 60;
    }
    else if (instance_exists(o_Enemy)) {
        global.game_state = "POST_SCORE";
        global.score_delay = 90;
    } else {
        alarm[0] = 60;
    }
}