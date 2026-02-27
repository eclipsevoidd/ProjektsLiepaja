var _size = 22;
var _gap = 5;

draw_set_color(c_white); draw_set_alpha(0.85);
draw_line_width(x - _size, y, x - _gap, y, 2);
draw_line_width(x + _gap, y, x + _size, y, 2);
draw_line_width(x, y - _size, x, y - _gap, 2);
draw_line_width(x, y + _gap, x, y + _size, 2);
draw_set_alpha(1);
draw_circle(x, y, 2, false);
draw_set_alpha(0.3);
