/// @description Initialize dialogue object at bottom center of the screen

// Default dialogue lines
if (!variable_instance_exists(id, "dialogue_lines")) {
    dialogue_lines = ["No dialogue provided"];
}

current_line = 0;      // current dialogue line
showing_text = true;   // whether dialogue is visible

// Typing effect
typing_speed = 1;      // letters per step
typed_letters = 0;

// Text position inside dialogue box
text_offset_x = 32;
text_offset_y = 16;

// Dialogue box size
box_width = 1820;
box_height = 300;

// Center the object horizontally and place at bottom
x = room_width / 2 - box_width / 2;
y = room_height - box_height - 32; // 32 pixels from bottom