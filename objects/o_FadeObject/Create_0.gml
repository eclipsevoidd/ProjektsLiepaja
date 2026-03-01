if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}

persistent = true;
alpha = 0;
fadeOut = true;
timer = 0;
targetRoom = rm_Map;
fadeSpeed = 1;
delay = 1;