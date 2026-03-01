if(sprite_index == s_KarostasPrisonKey_1){
	o_scoreKarostasPrison.totalScore -= 1;
	o_scoreKarostasPrison.keysTaken += 1;
		audio_play_sound(snd_KeyPickup, 10, false);
	instance_destroy();
}

if(sprite_index == s_KarostasPrisonIce){
	o_prisonEnemy_1.canMove = false;
	o_prisonEnemy_2.canMove = false;
	o_prisonEnemy_3.canMove = false;
	o_prisonEnemy_1.freezeTimer = 15 * 1000000;
	o_prisonEnemy_2.freezeTimer = 15 * 1000000;
	o_prisonEnemy_3.freezeTimer = 15 * 1000000;
		audio_play_sound(snd_Freeze, 10, false);
	instance_destroy();
}

if(sprite_index == s_KarostasPrisonDrink){
	o_prisonPlayer.hasEnergyDrink = true;
	o_prisonPlayer.energy_timer = 0;
	audio_play_sound(snd_EnergyDrink, 10, false);
	instance_destroy();
}