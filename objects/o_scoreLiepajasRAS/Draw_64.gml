if (totalScore < 0) {
    totalScore = 0;
}

draw_set_font(f_FranklinGothicMedLarge)

draw_text_transformed(30, 90, "Atlikušie atkritumi: " + string(totalScore), 1, 1, 0)
draw_text_transformed(30, 120, "Punkti: " + string(correctlySortedTrash * 5) +
"\n\nWASD - kustēties" + 
"\nE - izmest", 1, 1, 0);

if(totalScore == 0){
	scr_submit_score(GAME.RAS, correctlySortedTrash * 5);
	completeMinigame(GAME.RAS);
	fadeToRoom(rm_liepajasRASOutro, 1, 1);
}