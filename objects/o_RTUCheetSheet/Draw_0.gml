if (move_to_target) {		
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1.0); // Atgriež caurspīdīgumu uz pilnu
}
draw_self(); // Uzzīmē pašu špikeru pa virsu tumšajam fonam
