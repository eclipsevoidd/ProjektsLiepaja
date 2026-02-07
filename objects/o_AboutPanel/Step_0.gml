x_pos = lerp(x_pos, target_x, 0.15);

if (closing && !is_closing) {
    is_closing = true;
}

if (closing && abs(x_pos - offscreen_x) < 100) {
    instance_destroy();
}