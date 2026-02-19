// Movement / animation
idle_frame = 0;            
running_frames_start = 1;  
running_frames_end = sprite_get_number(sprite_index) - 1;

frame_index = idle_frame;
frame_timer = 0;
frame_delay = 8;

// Life
playerLifes = 3;

// Facing
facing_right = true;

// Sprint / stamina
move_speed = 4;
sprint_speed = 8;

max_stamina = 100;
stamina = max_stamina;

// per second while sprinting
stamina_drain = 25; 
// per second
stamina_regen = 15;        
 // seconds to wait before regen starts
stamina_regen_delay = 1.0;

// timer to track delay
regen_timer = 0;           

hasEnergyDrink = false;