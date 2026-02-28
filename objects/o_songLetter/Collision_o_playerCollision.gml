if ((keyboard_check_pressed(vk_up) && pickedLetter != "VK_UP") ||
    (keyboard_check_pressed(vk_down) && pickedLetter != "VK_DOWN") ||
    (keyboard_check_pressed(vk_left) && pickedLetter != "VK_LEFT") ||
    (keyboard_check_pressed(vk_right) && pickedLetter != "VK_RIGHT")) {
    
    o_scoreConcertHall.totalScore -= 1;
	
	var audioToPlay = incorrectKey[irandom(array_length(incorrectKey) - 1)];
	
	audio_play_sound(audioToPlay, 50, false, 0.20);
	
	fading = true;

}

if ((pickedLetter == "VK_UP" && keyboard_check_pressed(vk_up)) ||
    (pickedLetter == "VK_DOWN" && keyboard_check_pressed(vk_down)) ||
    (pickedLetter == "VK_LEFT" && keyboard_check_pressed(vk_left)) ||
    (pickedLetter == "VK_RIGHT" && keyboard_check_pressed(vk_right))) {
		
	o_scoreConcertHall.totalScore += 1;
    
	fading = true;
}
