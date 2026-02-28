// Animation variables
frame_index = 0;      // Current frame
frame_delay = 10;     // Steps to wait per frame
frame_timer = 0;      // Timer for frame delay

// Direction
facing_right = true;  // Start facing right

npc_speed = 4;

// --- GRID SETTINGS ---
grid_width = 64;
grid_height = 64;

path = noone;

canMove = true;
freezeTimer = 15 * 1000000;

mp_grid = mp_grid_create(
    0, 0,
    room_width div grid_width,
    room_height div grid_height,
    grid_width,
    grid_height
);

// Get tilemap ID (change "Walls" to your layer name)
var tilemap_id = layer_tilemap_get_id("TilesCollision");

// Loop grid
for (var i = 0; i < room_width div grid_width; i++)
{
    for (var j = 0; j < room_height div grid_height; j++)
    {
        var world_x = i * grid_width;
        var world_y = j * grid_height;

        var tiledata = tilemap_get_at_pixel(tilemap_id, world_x, world_y);

        // If a tile exists here, block it
        if (tiledata != 0)
        {
            mp_grid_add_cell(mp_grid, i, j);
        }
    }
}
