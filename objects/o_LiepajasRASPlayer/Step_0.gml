
var input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));


var len = point_distance(0, 0, input_x, input_y);
if (len > 0) {
    input_x /= len;
    input_y /= len;
}


var dt = delta_time / 1000000;

// ENERGY DRINK BOOST
if (!variable_instance_exists(id, "energy_timer")) energy_timer = 0;

if (hasEnergyDrink) {
    move_speed_current = 8;      
    stamina = max_stamina; 
    energy_timer += dt;       

    if (energy_timer >= 15) {  
        hasEnergyDrink = false;
        energy_timer = 0;
        move_speed_current = move_speed;
    }
} else {
    // SPRINT WITH DELAYED REGEN
    is_sprinting = keyboard_check(vk_shift) && stamina > 0 && (input_x != 0 || input_y != 0);

    if (is_sprinting) {
        move_speed_current = sprint_speed;
        stamina -= stamina_drain * dt;
        regen_timer = 0; // reset regen delay when sprinting
    } else {
        move_speed_current = move_speed;

        // Only start regenerating after delay
        if (stamina < max_stamina) {
            regen_timer += dt;
            if (regen_timer >= stamina_regen_delay) {
                stamina += stamina_regen * dt;
            }
        }
    }

    stamina = clamp(stamina, 0, max_stamina);
}


// CALCULATE MOVEMENT VECTOR
var move_x = input_x * move_speed_current;
var move_y = input_y * move_speed_current;

// TILE COLLISION

collisionTileMap = layer_tilemap_get_id("Border");

function tile_solid(_x, _y) {
    return tilemap_get_at_pixel(collisionTileMap, _x, _y) != 0;
}

var moved = false;

// Horizontal movement with collision
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

// Vertical movement with collision
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
// DIRECTIONAL ANIMATION
// --------------------------

var dir = -1;

// Determine direction based on input
if (input_y > 0) dir = 0;        // DOWN (Forward)
else if (input_y < 0) dir = 1;   // UP (Back)
else if (input_x < 0) dir = 2;   // LEFT
else if (input_x > 0) dir = 3;   // RIGHT

// Each direction has 3 frames
var frames_per_dir = 3;

if (moved && dir != -1) {

    var start_frame = dir * frames_per_dir;
    var end_frame = start_frame + frames_per_dir - 1;

    frame_timer += 1;

    if (frame_timer >= frame_delay) {

        frame_index += 1;
        frame_timer = 0;

        if (frame_index < start_frame || frame_index > end_frame) {
            frame_index = start_frame;
        }

        if (frame_index > end_frame) {
            frame_index = start_frame;
        }
    }

} else {
    // Idle frame = first frame of last direction moved
    if (dir != -1) {
        frame_index = dir * frames_per_dir;
    }
}

image_index = frame_index;