with (o_Jet) {
    if (firing) {
        var _ctrl = other;
        var _total = _ctrl.pool_r_outer - _ctrl.pool_r_inner;
        var _steps = floor(stream_progress * 20);
        
        for (var s = 0; s <= _steps; s++) {
            var _frac = s / 20;
            var _sr = _ctrl.pool_r_outer - 8 - _frac * _total;
            var _sx = _ctrl.pool_cx + lengthdir_x(_sr, jet_angle);
            var _sy = _ctrl.pool_cy + lengthdir_y(_sr, jet_angle);
            
            draw_set_alpha(0.6);
            draw_set_color(make_color_rgb(180, 230, 255));
            draw_circle(_sx, _sy, 5 + random(2), false);
            draw_set_color(c_white);
            draw_set_alpha(0.4);
            draw_circle(_sx, _sy, 2 + random(1), false);
        }
        draw_set_alpha(1);
    }
    
    // Warning
    if (warning) {
        var _ctrl = other;
        var _jx = _ctrl.pool_cx + lengthdir_x(_ctrl.pool_r_outer, jet_angle);
        var _jy = _ctrl.pool_cy + lengthdir_y(_ctrl.pool_r_outer, jet_angle);
        draw_set_alpha(0.3 + sin(current_time / 80) * 0.3);
        draw_set_color(c_red);
        draw_circle(_jx, _jy, 14, false);
        draw_set_alpha(1);
    }
}

// --- Coins ---
with (o_Coin) {
    draw_sprite(s_Coin, 0, x, y);
}

// --- Ducks ---
with (o_Duck) {
    draw_sprite(s_Duck, 0, x, y);
}

// --- Speed Rings ---
with (o_Speed_Ring) {
    var _pulse = 0.7 + sin(current_time / 150) * 0.3;
    draw_sprite_ext(s_Speed_Ring, 0, x, y, 1, 1, 0, c_white, _pulse);
}

// --- Swimmers ---
with (o_Swimmer) {
    // Face the direction they're moving (tangent to circle)
    var _face = angle_pos + 90;
    draw_sprite_ext(s_Swimmer, 0, x, y, 1, 1, _face, c_white, 1);
}

// --- Player ---
var _player = instance_find(o_PlayerSpa, 0);
if (instance_exists(_player)) {
    // Boost glow
    if (_player.boosted) {
        draw_set_alpha(0.3);
        draw_set_color(make_color_rgb(0, 255, 200));
        draw_circle(_player.x, _player.y, 26, false);
        draw_set_alpha(1);
    }
    
    var _pa = 1;
    var _pc = c_white;
    if (_player.stunned) {
        _pa = 0.5 + sin(current_time / 40) * 0.5;
        _pc = c_yellow;
    }
    
    // ALWAYS facing up (angle = 90 in GameMaker = up)
    // If your sprite is drawn facing up by default, use 0
    // If your sprite is drawn facing right by default, use 90
    draw_sprite_ext(s_PlayerSpa, 0, _player.x, _player.y, 1, 1, 0, _pc, _pa);
    
    // Stun stars
    if (_player.stunned) {
        var _spin = current_time / 5;
        for (var i = 0; i < 3; i++) {
            var _sa = _spin + (360/3)*i;
            draw_sprite_ext(s_Stun_Stars, 0, _player.x+lengthdir_x(22,_sa), _player.y+lengthdir_y(22,_sa), 0.5, 0.5, _sa, c_white, 0.8);
        }
    }
}

draw_set_color(c_white);
draw_set_alpha(1);