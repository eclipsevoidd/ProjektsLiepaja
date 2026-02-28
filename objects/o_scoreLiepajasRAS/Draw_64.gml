if (totalScore < 0) {
    totalScore = 0;
}


draw_text_transformed(30, 90, "Atlikušie atkritumi: " + string(totalScore), 2, 2, 0);

if(totalScore == 0){
	fadeToRoom(rm_liepajasRASOutro, 1, 1);
}