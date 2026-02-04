var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);

instance_create_layer(-8000, 261, layer_get_id("Instances"), o_BusDrive, {image_xscale : 1.75, 
															image_yscale : 1.75});
															
alarm[0] = random_range(5, 25) * game_get_speed(gamespeed_fps);