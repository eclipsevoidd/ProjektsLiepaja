if (totalScore < 0) {
    totalScore = 0;
}


draw_text_transformed(30, 90, "Atlikušie atkritumi: " + string(totalScore), 2, 2, 0);
draw_text_transformed(30, 180, "Punkti: " + string(correctlySortedTrash * 5), 2, 2, 0);

if(totalScore == 0){
	scr_submit_score(GAME.RAS, correctlySortedTrash * 5);
	completeMinigame(GAME.RAS);
	fadeToRoom(rm_liepajasRASOutro, 1, 1);
}