var can_click = false;

if (variable_global_exists("popup_active")) {
    if (!global.popup_active) can_click = true;
} else {
    can_click = true; 
}

if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) && can_click) {
    selected = true;
    
    var current_slot = instance_place(x, y, o_Slot);
    if (current_slot != noone) {
        current_slot.occupant = -1; 
    }
}

if (selected) {
    x = mouse_x;
    y = mouse_y;
    
    if (mouse_check_button_released(mb_left)) {
        selected = false;
        
        var tuvakais_slot = instance_nearest(x, y, o_Slot);
        
        if (tuvakais_slot != noone && point_distance(x, y, tuvakais_slot.x, tuvakais_slot.y) < 60) {
            
            if (tuvakais_slot.occupant == -1) {
                x = tuvakais_slot.x;
                y = tuvakais_slot.y;
                tuvakais_slot.occupant = vada_id;
            } else {
                x = anchor_x;
                y = anchor_y;
            }
        } else {
            x = anchor_x;
            y = anchor_y;
        }
    }
}