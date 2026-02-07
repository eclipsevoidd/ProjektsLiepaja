anchor_x = 75;
anchor_y = 100; 
offscreen_x = 2500; 
x_pos = offscreen_x; 
target_x = anchor_x; 
driftSpeed = -0.05;
closing = false;
is_closing = false;

// Left Button
left_arrow = instance_create_depth(0, 0, depth - 1, o_LeftArrow);
left_arrow.offset_x = 100; 
left_arrow.offset_y = 100;

// Right Button
right_arrow = instance_create_depth(0, 0, depth - 1, o_RightArrow);
right_arrow.offset_x = 1100; 
right_arrow.offset_y = 100;