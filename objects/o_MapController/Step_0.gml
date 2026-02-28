if (position_meeting(mouse_x, mouse_y, o_MapButton)) exit;

// --- 1. THE LOCK CHECK ---
// If your info panel object exists, stop the scrolling logic immediately
// Replace 'obj_location_panel' with the actual name of your panel object
if (instance_exists(o_PlacePanel)) {
    exit; 
}

// --- 2. CONFIGURATION ---
var scroll_speed = 25;    // How fast the target moves when hovering
var edge_size = 80;       // The "Hot Zone" size in pixels
var lerp_weight = 0.1;    // Smoothness (0.1 = 10% move per frame)

// --- 3. INPUT DETECTION ---
var mouse_win_y = window_mouse_get_y();

// Adjust the target based on mouse position relative to the window
if (mouse_win_y < edge_size) {
    target_y -= scroll_speed;
} 
else if (mouse_win_y > win_h - edge_size) {
    target_y += scroll_speed;
}

// --- 4. BOUNDARIES ---
// Clamp the target so it stays within the room
// Note: Ensure your Room Height is larger than your Camera Height!
target_y = clamp(target_y, 0, room_height - cam_h);

// --- 5. SMOOTH MOVEMENT (LERP) ---
var cam = view_camera[0];
var current_y = camera_get_view_y(cam);

// Calculate the smooth position
var final_y = lerp(current_y, target_y, lerp_weight);

// --- 6. APPLY TO CAMERA ---
// Keep X at 0 (or camera_get_view_x) and apply the new Y
camera_set_view_pos(cam, camera_get_view_x(cam), final_y);