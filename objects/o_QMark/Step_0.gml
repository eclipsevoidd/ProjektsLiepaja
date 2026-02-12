x += move_speed_x;
y += move_speed_y;

if (y < -200 || y > room_height + 200) {
    instance_destroy();
}