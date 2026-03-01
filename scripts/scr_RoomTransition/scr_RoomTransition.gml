function fadeToRoom(_targetRoom, _fadeSpeed, _delay){
    if (instance_exists(o_FadeObject)) exit;
    
    var _fader = instance_create_depth(0, 0, -9999, o_FadeObject);
    
    with (_fader) {
        targetRoom = _targetRoom;
        fadeSpeed = _fadeSpeed;
        delay = _delay;
    }
}