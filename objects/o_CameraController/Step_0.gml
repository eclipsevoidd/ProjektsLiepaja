// middle pos
var _target_x = 960;
var _target_y = 540;

var _mouse_dist_x = (mouse_x - _target_x) * cameraSensitivity;
var _mouse_dist_y = (mouse_y - _target_y) * cameraSensitivity;

var _final_x = _target_x + _mouse_dist_x;
var _final_y = _target_y + _mouse_dist_y;

// get current camera position
var _curr_x = camera_get_view_x(view_camera[0]);
var _curr_y = camera_get_view_y(view_camera[0]);

// centered destination
var _dest_x = _final_x - (1920 / 2);
var _dest_y = _final_y - (1080 / 2);

// smooth movement (lerp function)
_smooth_x = lerp(_curr_x, _dest_x, 0.1);
_smooth_y = lerp(_curr_y, _dest_y, 0.1);

camera_set_view_pos(view_camera[0], _smooth_x, _smooth_y);