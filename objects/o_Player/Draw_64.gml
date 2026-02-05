if (is_shooting) {
    var bx = 50, by = 50, bw = 200, bh = 20;

    // Background
    draw_set_color(c_black);
    draw_rectangle(bx, by, bx + bw, by + bh, false);

    // Green Zone
    draw_set_color(c_lime);
    var gz_start = bx + (perfect_min / 100) * bw;
    var gz_end = bx + (perfect_max / 100) * bw;
    draw_rectangle(gz_start, by, gz_end, by + bh, false);

    // Moving Bar
    draw_set_color(c_white);
    var fill = (shot_value / 100) * bw;
    draw_rectangle(bx, by, bx + fill, by + bh, false);
}