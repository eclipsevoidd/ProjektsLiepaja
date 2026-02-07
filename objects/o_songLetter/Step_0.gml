x -= 5;

if(fading){
	alpha -= fade_speed;
	
	if(alpha <= 0)
		instance_destroy();
}