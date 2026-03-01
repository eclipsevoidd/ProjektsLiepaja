if (cooldown > 0) { cooldown--; if (cooldown <= 0) can_shoot = true; }
if (recoil > 0) recoil = lerp(recoil, 0, 0.12);
if (flash_timer > 0) flash_timer--;

var _gc = o_gameController;
if (!instance_exists(_gc) || _gc.state != GS.PLAYING) exit;

if (mouse_check_button_pressed(mb_left) && can_shoot) {
    audio_play_sound(snd_shoot, 15, false);

    var _hit = false;

    // 1. Check popups
    var _pop = instance_nearest(mouse_x, mouse_y, o_enemy_popup);
    if (_pop != noone && _pop.alive) {
        if (point_distance(mouse_x, mouse_y, _pop.x, _pop.y - 30) < 50) {
            _pop.alive = false;
            _pop.hit = true;
            scr_hit(mouse_x, mouse_y, _gc.pts_popup);
            _hit = true;
            
            var _snd = audio_play_sound(snd_screm, 10, false);
            audio_sound_pitch(_snd, random_range(0.9, 1.1));
        }
    }

    // 2. Check ships
    if (!_hit) {
        var _sh = instance_nearest(mouse_x, mouse_y, o_enemy_ship);
        if (_sh != noone && point_distance(mouse_x, mouse_y, _sh.x, _sh.y) < 80) {
            _sh.hp--;
            if (_sh.hp <= 0) {
                scr_hit(_sh.x, _sh.y, _gc.pts_ship);
                instance_destroy(_sh)
            } else {
                _sh.flash = 6;
                scr_hit(_sh.x, _sh.y, 1);
            }
            _hit = true;
        }
    }

    // 3. Check soldiers
    if (!_hit) {
        var _sl = instance_nearest(mouse_x, mouse_y, o_enemy_soldier);
        if (_sl != noone && point_distance(mouse_x, mouse_y, _sl.x, _sl.y - 40) < 55) {
            scr_hit(_sl.x, _sl.y, _gc.pts_soldier);
            instance_destroy(_sl);
            _hit = true;
            
            var _snd = audio_play_sound(snd_screm, 10, false);
            audio_sound_pitch(_snd, random_range(1.1, 1.3)); // Higher pitch for soldiers
        }
    }

    // Miss
    if (!_hit) {
        _gc.score_val += _gc.pts_miss;
        var _m = instance_create_layer(mouse_x, mouse_y, "Instances", o_txt);
        _m.text = string(_gc.pts_miss);
        _m.col = c_red;
    }
}