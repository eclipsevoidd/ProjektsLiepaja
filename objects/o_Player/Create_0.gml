// States
has_ball = false;
is_shooting = false;

// Movement
walk_speed = 5;
hsp = 0;

// Sprites (Change these to your actual sprite names)
s_idle = s_player_idle;
s_walk = s_player_walk;
s_dribble = s_player_dribble;
s_shoot = s_player_shoot;
s_idle_ball = s_player_idle_ball;

shot_value = 0;          // 0 to 100
shot_speed = 2.5;        // How fast the bar fills
perfect_min = 75;        // Green zone start
perfect_max = 85;        // Green zone end
shot_result = "";