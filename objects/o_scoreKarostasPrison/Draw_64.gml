if (totalScore < 0) {
    totalScore = 0;
}


draw_text_transformed(30, 30, "Atlikušās atslēgas: " + string(totalScore), 2, 2, 0);

if(totalScore == 0){
	
	if(keysTaken * 5 < keysTaken * 5 - (30 - o_prisonPlayer.playerLifes * 10))
		keysTaken = 0;
	
	scr_submit_score(GAME.CIETUMS, keysTaken * 5);
	completeMinigame(GAME.CIETUMS);
	fadeToRoom(rm_KarostasPrisonOutro, 1, 1);	
}