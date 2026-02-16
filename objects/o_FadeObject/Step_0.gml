var _dt = delta_time / 1000000;

if (fadeOut) { 
    if (alpha < 1) {
        alpha += fadeSpeed * _dt; 
    } else {
        alpha = 1;
        timer += _dt;
        if (timer >= delay) {
            room_goto(targetRoom);
            fadeOut = false;
        }
    }
} else {
    alpha -= fadeSpeed * _dt;
    if (alpha <= 0)
		instance_destroy();
}