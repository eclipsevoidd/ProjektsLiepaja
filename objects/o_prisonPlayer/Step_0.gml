// --------------------------
// CONFIGURATION
// --------------------------
collisionTileMap = layer_tilemap_get_id("TilesCollision"); // Name of your collision tile layer
move_speed = 4;

// --------------------------
// INPUT
// --------------------------
var input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize input so diagonal isn't faster
var len = point_distance(0, 0, input_x, input_y);
if (len > 0) {
    input_x /= len;
    input_y /= len;
}

// Desired movement
var move_x = input_x * move_speed;
var move_y = input_y * move_speed;

// --------------------------
// TILE COLLISION FUNCTION
// --------------------------
function tile_solid(_x, _y) {
    return tilemap_get_at_pixel(collisionTileMap, _x, _y) != 0;
}

// --------------------------
// HORIZONTAL MOVEMENT
// --------------------------
if (move_x != 0) {
    if (!tile_solid(bbox_left + move_x, bbox_top) &&
        !tile_solid(bbox_right + move_x, bbox_top) &&
        !tile_solid(bbox_left + move_x, bbox_bottom) &&
        !tile_solid(bbox_right + move_x, bbox_bottom)) 
    {
        x += move_x;
    }
}

// --------------------------
// VERTICAL MOVEMENT
// --------------------------
if (move_y != 0) {
    if (!tile_solid(bbox_left, bbox_top + move_y) &&
        !tile_solid(bbox_right, bbox_top + move_y) &&
        !tile_solid(bbox_left, bbox_bottom + move_y) &&
        !tile_solid(bbox_right, bbox_bottom + move_y)) 
    {
        y += move_y;
    }
}


