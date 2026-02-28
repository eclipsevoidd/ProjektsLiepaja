if (level_info == undefined) level_info = get_level_info(level_id);

// Lerp movement
var _target = closing ? 1500 : target_y; // Slide down to exit
panel_y = lerp(panel_y, _target, 0.12);
bg_alpha = lerp(bg_alpha, closing ? 0 : 0.7, 0.12);

if (closing && panel_y > 1400) instance_destroy();

// Mouse Logic
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _cx = display_get_gui_width() / 2;

if (!closing && !instance_exists(o_FadeObject)) {
    // START BUTTON CHECK
    var _btn_y = panel_y + 220;
    if (point_in_rectangle(_mx, _my, _cx - 100, _btn_y - 30, _cx + 100, _btn_y + 30)) {
        if (mouse_check_button_pressed(mb_left)) fadeToRoom(level_info.room, 0.5, 1);
    }
    
    // CLOSE/X CHECK (Top right of panel)
    if (point_in_circle(_mx, _my, _cx + 230, panel_y - 280, 20)) {
        if (mouse_check_button_pressed(mb_left)) closing = true;
    }
}