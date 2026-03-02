if (!global.paused) exit;

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
var _cx = _cam_x + _vw / 2;
var _cy = _cam_y + _vh / 2;

// Dim overlay
draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(_cam_x, _cam_y, _cam_x + _vw, _cam_y + _vh, false);
draw_set_alpha(1);

// Panel
draw_sprite(s_pause_panel, 0, _cx, _cy);

// Resume button
var _resume_cy = _cy - 120;
draw_sprite(s_btn_resume, hover_resume ? 1 : 0, _cx, _resume_cy);

// Volume slider
var _slider_w = 300;
var _slider_y = _cy + 10;
var _handle_x = (_cx - _slider_w / 2) + (global.master_volume * _slider_w);

draw_set_colour(c_dkgray);
draw_rectangle(_cx - _slider_w / 2, _slider_y - 4, _cx + _slider_w / 2, _slider_y + 4, false);
draw_set_colour(c_white);
draw_rectangle(_cx - _slider_w / 2, _slider_y - 4, _handle_x, _slider_y + 4, false);
draw_circle(_handle_x, _slider_y, 10, false);

draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(_cx, _slider_y - 30, "Volume");

// Exit button
var _exit_cy = _cy + 120;
draw_sprite(s_btn_exit, hover_exit ? 1 : 0, _cx, _exit_cy);

draw_set_halign(fa_left);