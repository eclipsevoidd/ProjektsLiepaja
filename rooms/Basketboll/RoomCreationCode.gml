// ROOM CREATION CODE
var _hoop_a = instance_find(o_hoop, 0);
var _hoop_b = instance_find(o_hoop, 1);

if (instance_exists(_hoop_a) && instance_exists(_hoop_b)) {
    if (_hoop_a.x < _hoop_b.x) {
        // Hoop A is Left, Hoop B is Right
        global.hoop_player_target = _hoop_a; // Left
        global.hoop_enemy_target  = _hoop_b; // Right
    } else {
        // Hoop B is Left, Hoop A is Right
        global.hoop_player_target = _hoop_b; // Left
        global.hoop_enemy_target  = _hoop_a; // Right
    }
}