if(o_noteSpawner.gameStarted){
	dt = delta_time / 1000000;

	timer -= dt;	
}

if(timer <= 0){
	timer = 0;
	fadeToRoom(rm_ConcertHallAfterShow, 1, 1);	
}
