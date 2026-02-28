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
    draw_text_transformed(_cx, _cy - 100, "TARZĀNA TRASE", 3, 3, 0);
    
    draw_set_color(c_gray);
    draw_text(_cx, _cy - 50, "Tiec līdz beigām!");
    
    // Poga
    var _btn_x = _cx;
    var _btn_y = _cy + 30;
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    var _over = point_in_rectangle(_mx, _my, _btn_x - btn_hw, _btn_y - btn_hh, _btn_x + btn_hw, _btn_y + btn_hh);
    btn_alpha = lerp(btn_alpha, _over ? 1.0 : 0.6, 0.12);
    
    draw_sprite_ext(s_StartPoga, 0, _btn_x, _btn_y, 1, 1, 0, c_white, btn_alpha);
    
    if (mouse_check_button_pressed(mb_left) && _over) {
        game_state = "PLAYING";
        death_count = 0;
        if (instance_exists(o_tarzansPlayer)) {
            o_tarzansPlayer.quiz_active = false;
        }
    }
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    exit;
}

// === PLAYING HUD ===
if (game_state == "PLAYING") {
    // Nāvju skaitītājs augšā labajā stūrī
    draw_set_alpha(0.5); draw_set_color(c_black);
    var _hud_x = _w - 180;
    draw_roundrect(_hud_x, 10, _w - 10, 50, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_right); draw_set_valign(fa_top);
    draw_set_color(death_count > 0 ? c_red : c_lime);
    draw_text(_w - 20, 18, "Nāves: " + string(death_count));
    
    // Kontroles kreisajā pusē
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_text(20, 20, "A/D - Kustēties");
    draw_text(20, 40, "SPACE - Lēkt / Atlaist virvi");
    draw_text(20, 60, "E - Dash");
    
    draw_set_halign(fa_left); draw_set_valign(fa_top);
}

draw_set_color(c_white); draw_set_alpha(1);

