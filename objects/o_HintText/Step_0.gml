var _inst = instance_position(mouse_x, mouse_y, o_MapButton);

if (_inst != noone) {
    hover_text = _inst.location_name;
} else {
    hover_text = "";
}