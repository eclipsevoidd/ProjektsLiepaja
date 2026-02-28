function fadeToRoom(targetRoom, fadeSpeed, delay){
	var _fader = instance_create_depth(0, 0, -9999, o_FadeObject);
	
	_fader.targetRoom = targetRoom;
	_fader.fadeSpeed = fadeSpeed;
	_fader.delay = delay;
}