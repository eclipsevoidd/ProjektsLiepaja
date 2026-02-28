/// @desc Zimesana
if (sprite_exists(s_KatedralsBG)) {
    draw_sprite_stretched(s_KatedralsBG, 0, 0, 0, 800, 450);
} else {
    draw_set_color(c_navy);
    draw_rectangle(0, 0, 800, 450, false);
}

draw_set_alpha(0.45);
draw_set_color(c_black);
draw_rectangle(0, 0, 800, 450, false);
draw_set_alpha(1);


switch (state) {

    case 0:
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        draw_set_font(fnt_title);
        draw_set_color(c_yellow);
        draw_text(400, 150, "Svētās Trīsvienības katedrāle");

        draw_set_font(fnt_normal);
        draw_set_color(c_lime);
        draw_text(400, 210, "Uzdevums: Atskaņo ērģeļu melodiju!");

        draw_set_color(c_aqua);
        draw_text(400, 250, "Turi marķieri zaļajā zona — krāsies punkti!");

        draw_set_font(fnt_title);
        draw_set_color(c_yellow);
        draw_text(400, 330, "[ ENTER — sakt ]");

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;

    case 1:

        // --- HUD ---
        draw_set_font(fnt_normal);

        // Laiks
        var _secs = ceil(time_remaining / 60);
        var _mins = _secs div 60;
        var _s = _secs mod 60;
        var _time_str = string(_mins) + ":" + ((_s < 10) ? "0" + string(_s) : string(_s));

        draw_set_halign(fa_left);
        draw_set_color(c_white);
        if (_secs <= 10) draw_set_color(c_red);
        draw_text(20, 12, "Laiks: " + _time_str);

        // Punkti
        draw_set_halign(fa_right);
        draw_set_color(c_yellow);
        draw_text(780, 12, "Punkti: " + string(floor(points)) + " / " + string(max_points));

        // Virsraksts
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text(400, 12, "Atskaņo melodiju!");

        var _bx = bar_x - bar_width / 2;

        // Joslas fons
        draw_set_color(c_dkgray);
        draw_rectangle(_bx, bar_y, _bx + bar_width, bar_y + bar_height, false);

        draw_set_color(c_gray);
        draw_rectangle(_bx, bar_y, _bx + bar_width, bar_y + bar_height, true);

        // Zala zona
        draw_set_alpha(0.55);
        draw_set_color(c_green);
        draw_rectangle(_bx, green_y, _bx + bar_width, green_y + green_height, false);
        draw_set_alpha(1);
        draw_set_color(c_lime);
        draw_rectangle(_bx, green_y, _bx + bar_width, green_y + green_height, true);

        // Markeris
        var _mc = marker_y + marker_height / 2;
        var _in = (_mc >= green_y) && (_mc <= green_y + green_height);

        if (_in) {
            draw_set_color(c_yellow);
        } else {
            draw_set_color(c_red);
        }
        draw_rectangle(_bx + 3, marker_y, _bx + bar_width - 3, marker_y + marker_height, false);

        draw_set_color(c_white);
        draw_rectangle(_bx + 3, marker_y, _bx + bar_width - 3, marker_y + marker_height, true);

        var _px = 150;
        var _py = 410;
        var _pw = 500;
        var _ph = 22;

        draw_set_color(c_dkgray);
        draw_rectangle(_px, _py, _px + _pw, _py + _ph, false);

        var _fill = (points / max_points) * _pw;
        if (points < 30) {
            draw_set_color(c_red);
        } else if (points < 60) {
            draw_set_color(c_orange);
        } else {
            draw_set_color(c_lime);
        }
        draw_rectangle(_px, _py, _px + _fill, _py + _ph, false);

        draw_set_color(c_white);
        draw_rectangle(_px, _py, _px + _pw, _py + _ph, true);

        draw_set_halign(fa_center);
        draw_set_font(fnt_small);
        draw_set_color(c_white);
        draw_text(_px + _pw / 2, _py + 3, string(floor(points)) + " / " + string(max_points));

        // Padoms
        draw_set_color(c_aqua);
        draw_text(400, 440, "SPACE — pacelt marķieri");

        draw_set_halign(fa_left);
        draw_set_font(fnt_normal);
        break;

    case 2:
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        draw_set_font(fnt_title);
        var _final = floor(points);

        if (_final >= 80) {
            draw_set_color(c_yellow);
            draw_text(400, 130, "Bravissimo!");
        } else if (_final >= 50) {
            draw_set_color(c_lime);
            draw_text(400, 130, "Labi!");
        } else if (_final >= 20) {
            draw_set_color(c_orange);
            draw_text(400, 130, "Var labāk...");
        } else {
            draw_set_color(c_red);
            draw_text(400, 130, "Hmm...");
        }

        draw_set_font(fnt_title);
        draw_set_color(c_white);
        draw_text(400, 200, string(_final) + " / " + string(max_points) + " punkti");

        // Punktu josla
        var _px2 = 200;
        var _py2 = 260;
        var _pw2 = 400;
        var _ph2 = 25;

        draw_set_color(c_dkgray);
        draw_rectangle(_px2, _py2, _px2 + _pw2, _py2 + _ph2, false);

        var _fill2 = (_final / max_points) * _pw2;
        if (_final >= 80) {
            draw_set_color(c_yellow);
        } else if (_final >= 50) {
            draw_set_color(c_lime);
        } else if (_final >= 20) {
            draw_set_color(c_orange);
        } else {
            draw_set_color(c_red);
        }
        draw_rectangle(_px2, _py2, _px2 + _fill2, _py2 + _ph2, false);
        draw_set_color(c_white);
        draw_rectangle(_px2, _py2, _px2 + _pw2, _py2 + _ph2, true);

        draw_set_font(fnt_normal);
        draw_set_color(c_aqua);
        var _time_used = time_total - ceil(time_remaining / 60);
        draw_text(400, 310, "Laiks: " + string(_time_used) + " sekundes");

        draw_set_color(c_yellow);
        draw_text(400, 370, "[ ENTER — turpināt ]");

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;
}