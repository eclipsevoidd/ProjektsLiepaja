var end_x = rope_anchor_x + lengthdir_x(rope_length, rope_angle - 90);
var end_y = rope_anchor_y + lengthdir_y(rope_length, rope_angle - 90);

draw_set_colour(c_dkgray);
draw_line_width(rope_anchor_x, rope_anchor_y, end_x, end_y, 3);
draw_circle(end_x, end_y, 4, false);