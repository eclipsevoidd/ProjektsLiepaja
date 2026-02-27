y += spd_y;
spd_y *= 0.97;
life--;
if (life <= 0) instance_destroy();