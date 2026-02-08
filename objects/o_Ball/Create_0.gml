hsp = 0;
vsp = 0;
grav = 0.5;
bounce = 0.6;

// --- ADD THIS LINE TO FIX THE CRASH ---
scored = false; 

// Trail Settings
trail_length = 6;
trail_x = array_create(trail_length, x);
trail_y = array_create(trail_length, y);

scored = false; // Add this to stop the draw event crash!