if(sprite_index == s_KarostasPrisonKey_1){
	o_scoreKarostasPrison.totalScore -= 1;
	instance_destroy();
}

if(sprite_index == s_KarostasPrisonIce){
	o_prisonEnemy_1.canMove = false;
	o_prisonEnemy_2.canMove = false;
	o_prisonEnemy_3.canMove = false;
	instance_destroy();
}