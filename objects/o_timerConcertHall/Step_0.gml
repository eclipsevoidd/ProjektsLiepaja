if (o_noteSpawner.gameStarted) {
    dt = delta_time / 1000000;
    timer -= dt;	
}
if (timer <= 0 && !fadeCalled) {
    fadeCalled = true;
    timer = 0;
	scr_submit_score(GAME.LOC, o_scoreConcertHall.totalScore);
	completeMinigame(1);
    fadeToRoom(rm_ConcertHallAfterShow, 1, 1);
}