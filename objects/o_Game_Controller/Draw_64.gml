draw_set_halign(fa_center); draw_set_valign(fa_top);
var _sec = ceil(timer / game_get_speed(gamespeed_fps));
var _ts = string(_sec div 60) + ":" + string_replace(string_format(_sec mod 60, 2, 0), " ", "0");

draw_set_color(c_black); draw_set_alpha(0.5);
draw_text(display_get_gui_width()/2+2, 22, _ts);
draw_set_alpha(1); draw_set_color(c_white);
draw_text(display_get_gui_width()/2, 20, _ts);

// Score
draw_set_halign(fa_right);
draw_set_color(c_black); draw_set_alpha(0.5);
draw_text(display_get_gui_width()-18, 22, "Score: " + string(score_total));
draw_set_alpha(1); draw_set_color(make_color_rgb(255,220,50));
draw_text(display_get_gui_width()-20, 20, "Score: " + string(score_total));

// Timer bar
var _bw = 300; var _bh = 8;
var _bx = (display_get_gui_width()-_bw)/2; var _by = 50;
draw_set_color(make_color_rgb(30,50,60));
draw_rectangle(_bx,_by,_bx+_bw,_by+_bh,false);
var _tf = timer / timer_max;
draw_set_color(merge_color(c_red, make_color_rgb(0,200,180), _tf));
draw_rectangle(_bx,_by,_bx+_bw*_tf,_by+_bh,false);

// Game over
if (game_ended) {
    draw_set_alpha(0.7); draw_set_color(c_black);
    draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
    draw_set_alpha(1);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    var _mx = display_get_gui_width()/2; var _my = display_get_gui_height()/2;
    draw_set_color(make_color_rgb(0,200,180));
    draw_text(_mx, _my-60, "Laiks Beidzass!");
    draw_set_color(make_color_rgb(255,220,50));
    draw_text(_mx, _my, "Tavi punkti: " + string(score_total));
    draw_set_color(c_gray);
    draw_text(_mx, _my+60, "spied enter lai ja niga");
}
draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_set_color(c_white); draw_set_alpha(1);