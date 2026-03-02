var cam_h = camera_get_view_height(view_camera[0]);

o_MapController.target_y = y - (cam_h / 2);

image_blend = c_gray;

is_locked = false;

hover_alpha = 0;

if (!variable_global_exists("currentLevel")) {
    global.currentLevel = 0; 
}