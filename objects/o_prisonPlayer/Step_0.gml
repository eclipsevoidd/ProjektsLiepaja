// --------------------------
// MOVEMENT CONFIG
// --------------------------
         
idle_frame = 0;            
running_frames_start = 1;  
running_frames_end = sprite_get_number(sprite_index) - 1;

// --------------------------
// INPUT
// --------------------------
var input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// --------------------------
// Debug
// --------------------------

if(keyboard_check_pressed(vk_f1)){
	move_speed ++;
}


// Normalize diagonal movement
var len = point_distance(0, 0, input_x, input_y);
if (len > 0) {
    input_x /= len;
    input_y /= len;
}

var move_x = input_x * move_speed;
var move_y = input_y * move_speed;

// --------------------------
// TILE COLLISION
// --------------------------
function tile_solid(_x, _y) {
    return tilemap_get_at_pixel(collisionTileMap, _x, _y) != 0;
}

// --------------------------
// HORIZONTAL & VERTICAL MOVEMENT
// --------------------------
var moved = false;

if (move_x != 0) {
    if (!tile_solid(x + move_x - sprite_width/2, y - sprite_height/2) &&
        !tile_solid(x + move_x + sprite_width/2, y - sprite_height/2) &&
        !tile_solid(x + move_x - sprite_width/2, y + sprite_height/2) &&
        !tile_solid(x + move_x + sprite_width/2, y + sprite_height/2)) 
    {
        x += move_x;
        moved = true;
    }
}

if (move_y != 0) {
    if (!tile_solid(x - sprite_width/2, y + move_y - sprite_height/2) &&
        !tile_solid(x + sprite_width/2, y + move_y - sprite_height/2) &&
        !tile_solid(x - sprite_width/2, y + move_y + sprite_height/2) &&
        !tile_solid(x + sprite_width/2, y + move_y + sprite_height/2)) 
    {
        y += move_y;
        moved = true;
    }
}

// --------------------------
// ANIMATION
// --------------------------
if (!variable_instance_exists(id, "frame_index")) frame_index = idle_frame;
if (!variable_instance_exists(id, "frame_timer")) frame_timer = 0;
if (!variable_instance_exists(id, "frame_delay")) frame_delay = 8;

if (moved) {
    frame_timer += 1;
    if (frame_timer >= frame_delay) {
        frame_index += 1;
        frame_timer = 0;
        if (frame_index > running_frames_end) frame_index = running_frames_start;
    }
} else {
    frame_index = idle_frame;
    frame_timer = 0;
}

image_index = frame_index;

// --------------------------
// FACING
// --------------------------
if (!variable_instance_exists(id, "facing_right")) facing_right = true;
if (input_x > 0) facing_right = true;
else if (input_x < 0) facing_right = false;

image_xscale = facing_right ? 1 : -1;
