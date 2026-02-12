var _cam = view_camera[0];
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);

if (!surface_exists(perspective_surf)) {
    perspective_surf = surface_create(_w, _h);
}

surface_set_target(perspective_surf);
draw_clear_alpha(c_black, 0);

with (o_QuizBG) {
    draw_self();
}

with (o_QMark) {  // Add this
    draw_self();
}

surface_reset_target();

shader_set(shd_perspective);
draw_surface(perspective_surf, 0, 0);
shader_reset();