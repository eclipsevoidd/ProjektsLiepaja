if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    selected = true;
}

if (selected) {
    x = mouse_x;
    y = mouse_y;
    
    if (mouse_check_button_released(mb_left)) {
        selected = false;
        
        var slot = instance_place(x, y, obj_slots);
        if (slot != noone) {
            x = slot.x;
            y = slot.y;
            slot.occupant = vada_id; 
        } else {
            x = anchor_x;
            y = anchor_y;
        }
    }
}