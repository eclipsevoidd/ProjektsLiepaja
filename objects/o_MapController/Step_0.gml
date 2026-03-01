if (position_meeting(mouse_x, mouse_y, o_MapButton)) exit;

var scroll_speed = 25;
var edge_size = 80;
var lerp_weight = 0.1;

var mouse_win_y = window_mouse_get_y();

if (mouse_win_y < edge_size) {
    target_y -= scroll_speed;
} 
else if (mouse_win_y > win_h - edge_size) {
    target_y += scroll_speed;
}

target_y = clamp(target_y, 0, room_height - cam_h);

var cam = view_camera[0];
var current_y = camera_get_view_y(cam);

var final_y = lerp(current_y, target_y, lerp_weight);

camera_set_view_pos(cam, camera_get_view_x(cam), final_y);