if (!variable_instance_exists(id, "dialogue_lines")) {
    dialogue_lines = ["Nav dialogs."];
}

current_line = 0;
showing_text = true;
typing_speed = 1;   
typed_letters = 0;

text_offset_x = 32;
text_offset_y = 16;

box_width = 1820;
box_height = 300;

x = room_width / 2 - box_width / 2;
y = room_height - box_height - 32;

callback_after_dialogue = noone;