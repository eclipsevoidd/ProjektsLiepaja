draw_set_alpha(alpha); // iestata zīmēšanas alpha līmeni uz mūsu definēto, lai izveidotu fade-in efektu
draw_set_color(c_black);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1); // restartē alpha uz fully opaque