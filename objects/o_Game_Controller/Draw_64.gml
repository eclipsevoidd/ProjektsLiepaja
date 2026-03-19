draw_set_font(f_FranklinGothicMedium);

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _cx = _w / 2;
var _cy = _h / 2;

// === MENU ===
if (game_state == "MENU") {
    draw_set_alpha(0.55);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
	draw_set_font(f_FranklinGothicLarge)
    draw_text_transformed(_cx, _cy - 100, "LIEPĀJAS SPA", 1, 1, 0);
    
    draw_set_color(c_gray);
    draw_text(_cx, _cy - 55, "Savāc monētas un izvairies no peldētājiem!");
    
    var _btn_x = _cx;
    var _btn_y = _cy + 30;
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _over = point_in_rectangle(_mx, _my, _btn_x - btn_hw, _btn_y - btn_hh, _btn_x + btn_hw, _btn_y + btn_hh);
    btn_alpha = lerp(btn_alpha, _over ? 1.0 : 0.6, 0.12);
    
    draw_sprite_ext(s_StartPoga, 0, _btn_x, _btn_y, 1, 1, 0, c_white, btn_alpha);
    
    if (mouse_check_button_pressed(mb_left) && _over) {
        game_state = "PLAYING";
        game_active = true;
        timer = timer_max;
        score_total = 0;
        difficulty = 1;
        
        // Spawn sākuma objektus
        var _jet_angles = [80, 97, 114];
        for (var i = 0; i < 3; i++) {
            var _j = instance_create_layer(pool_cx, pool_cy, "Instances", o_Jet);
            _j.jet_angle = _jet_angles[i];
        }
        repeat (2) {
            var _s = instance_create_layer(0, 0, "Instances", o_Swimmer);
            _s.angle_pos = random(360);
            _s.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 25, random(1));
            _s.spd = current_speed + random_range(-0.3, 0.3);
        }
        repeat (4) {
            var _c = instance_create_layer(0, 0, "Instances", o_Coin);
            _c.angle_pos = random(360);
            _c.radius_pos = lerp(pool_r_inner + 25, pool_r_outer - 20, random(1));
            _c.spd = current_speed;
        }
    }
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    draw_set_color(c_white); draw_set_alpha(1);
    exit;
}

// === PLAYING HUD ===
if (game_state == "PLAYING") {
    // Taimeris
    draw_set_halign(fa_center); draw_set_valign(fa_top);
    var _sec = ceil(timer / game_get_speed(gamespeed_fps));
    var _ts = string(_sec div 60) + ":" + string_replace(string_format(_sec mod 60, 2, 0), " ", "0");
    
	draw_set_font(f_FranklinGothicMedLarge)
    draw_set_color(c_black); 
	draw_set_alpha(0.5);
    draw_text(_cx + 2, 22, _ts);
    draw_set_alpha(1);
    draw_set_color((_sec <= 10) ? c_red : c_black);
    draw_text(_cx, 20, _ts + "\n\nWASD - kustēties\nSHIFT - peldēt ātrak");
    
    // Punkti
	draw_set_font(f_FranklinGothicMedLarge)
    draw_set_halign(fa_right);
    draw_set_color(c_black); draw_set_alpha(0.5);
    draw_text(_w - 18, 22, "Punkti: " + string(score_total));
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(255, 220, 50));
    draw_text(_w - 20, 20, "Punkti: " + string(score_total));
    
    // Laika josla
    var _bw = 300; var _bh = 8;
    var _bx = (_w - _bw) / 2; var _by = 50;
    draw_set_color(make_color_rgb(30, 50, 60));
    draw_rectangle(_bx, _by, _bx + _bw, _by + _bh, false);
    var _tf = timer / timer_max;
    draw_set_color(merge_color(c_red, make_color_rgb(0, 200, 180), _tf));
    draw_rectangle(_bx, _by, _bx + _bw * _tf, _by + _bh, false);
}

// === ENDED ===
if (game_state == "ENDED") {
    draw_set_alpha(0.7); draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    
    draw_set_color(make_color_rgb(0, 200, 180));
    draw_text_transformed(_cx, _cy - 60, "Laiks beidzās!", 2.5, 2.5, 0);
    
    draw_set_color(make_color_rgb(255, 220, 50));
	draw_set_font(f_FranklinGothicLarge)
    draw_text_transformed(_cx, _cy, "Tavi punkti: " + string(score_total), 1, 1, 0);
    
    draw_set_color(c_gray);
    draw_text(_cx, _cy + 60, "Nospied ENTER lai turpinātu");
    
    if (keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
        room_goto(rm_MainMenu);
    }
}

draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_set_color(c_white); draw_set_alpha(1);