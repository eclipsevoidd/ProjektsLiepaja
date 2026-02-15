// INPUT
var input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// DIAGONAL NORMALIZATION
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

collisionTileMap = layer_tilemap_get_id("TilesCollision");

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


// ANIMATION
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

// FACING
if (input_x > 0) facing_right = true;
else if (input_x < 0) facing_right = false;

image_xscale = facing_right ? 1 : -1;
