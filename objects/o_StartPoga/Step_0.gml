var _panel_active = instance_exists(o_AboutPanel) && !o_AboutPanel.is_closing;

if (_panel_active) {
    target_x = anchor_x + offset_when_panel_open_x;
    target_y = anchor_y + offset_when_panel_open_y;
} else {
    target_x = anchor_x;
    target_y = anchor_y;
}

current_x = lerp(current_x, target_x, 0.15);
current_y = lerp(current_y, target_y, 0.15);