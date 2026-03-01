dt = delta_time / 1000000;
    timer -= dt;


if (timer <= 0 && !fadeCalled) {
    fadeCalled = true;
    timer = 0;
	scr_submit_score(GAME.RAS, o_scoreLiepajasRAS.correctlySortedTrash * 5);
	completeMinigame(GAME.RAS);
	fadeToRoom(rm_liepajasRASOutro, 1, 1);
}