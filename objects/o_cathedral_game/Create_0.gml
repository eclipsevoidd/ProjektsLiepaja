
state = 0;

points = 0;
max_points = 100;

time_total = 60;
time_remaining = time_total * 60;

point_speed = 100 / (time_total * 60); 

bar_x = 400;
bar_y = 70;
bar_height = 300;
bar_width = 40;

green_height = 70;
green_y = bar_y + 100;
green_speed = 1.2;
green_dir = 1;

marker_y = bar_y + bar_height / 2;
marker_height = 16;
marker_vel = 0;
marker_grav = 0.22;
marker_lift = -0.55;
marker_max_spd = 3.5;

music_playing = false;