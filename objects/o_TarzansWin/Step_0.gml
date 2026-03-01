if (keyboard_check_pressed(vk_enter)) {
    scr_submit_score(GAME.TARZANS, pscore);
	completeMinigame(GAME.TARZANS);
	fadeToRoom(rm_TarzansOutro, 1, 1);
}