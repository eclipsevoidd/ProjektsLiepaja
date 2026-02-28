stamina = o_prisonPlayer.stamina;
max_stamina = o_prisonPlayer.max_stamina;

bar_width = 200;
bar_height = 20;
bar_x = 32;
bar_y = 90;

fill_width = (stamina / max_stamina) * bar_width;
// Background
draw_set_color(c_black);
draw_rectangle(bar_x - 2, bar_y - 2, bar_x + bar_width + 2, bar_y + bar_height + 2, false);

// Fill
if (stamina / max_stamina < 0.2) draw_set_color(c_red);
else draw_set_color(c_lime);

draw_rectangle(bar_x, bar_y, bar_x + fill_width, bar_y + bar_height, false);

// Outline
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);
