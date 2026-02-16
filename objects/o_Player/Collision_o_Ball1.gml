if (!has_ball && other.vspeed >= 0) { 
    has_ball = true;
    instance_destroy(other); 
}