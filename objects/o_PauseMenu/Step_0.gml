if (keyboard_check_pressed(vk_escape)) {
    global.paused = !global.paused;
}

if (!global.paused) exit;

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
var _cx = _cam_x + _vw / 2;
var _cy = _cam_y + _vh / 2;

var _mx = mouse_x;
var _my = mouse_y;

var _resume_cx = _cx;
var _resume_cy = _cy - 120;
var _exit_cx = _cx;
var _exit_cy = _cy + 120;

var _btn_resume_hw = sprite_get_width(s_btn_resume) / 2;
var _btn_resume_hh = sprite_get_height(s_btn_resume) / 2;
var _btn_exit_hw = sprite_get_width(s_btn_exit) / 2;
var _btn_exit_hh = sprite_get_height(s_btn_exit) / 2;

hover_resume = point_in_rectangle(_mx, _my,
    _resume_cx - _btn_resume_hw, _resume_cy - _btn_resume_hh,
    _resume_cx + _btn_resume_hw, _resume_cy + _btn_resume_hh);
if (hover_resume && mouse_check_button_pressed(mb_left)) {
    global.paused = false;
}

hover_exit = point_in_rectangle(_mx, _my,
    _exit_cx - _btn_exit_hw, _exit_cy - _btn_exit_hh,
    _exit_cx + _btn_exit_hw, _exit_cy + _btn_exit_hh);
if (hover_exit && mouse_check_button_pressed(mb_left)) {
    game_end();
}

var _slider_w = 300;
var _slider_y = _cy + 10;
slider_min_x = _cx - _slider_w / 2;
slider_max_x = _cx + _slider_w / 2;

if (mouse_check_button(mb_left) && point_in_rectangle(_mx, _my, slider_min_x - 10, _slider_y - 20, slider_max_x + 10, _slider_y + 20)) {
    slider_dragging = true;
}
if (mouse_check_button_released(mb_left)) slider_dragging = false;

if (slider_dragging) {
    global.master_volume = clamp((_mx - slider_min_x) / _slider_w, 0, 1);
    audio_master_gain(global.master_volume);
}