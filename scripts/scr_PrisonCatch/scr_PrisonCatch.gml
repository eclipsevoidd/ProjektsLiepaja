function scr_PrisonCatch(){
	
	o_prisonPlayer.playerLifes--;
	
	if(playerLifes == 2){
		o_prisonPlayer.x = 3551;
		o_prisonPlayer.y = 272;
		
		o_prisonEnemy_1.x = 668;
		o_prisonEnemy_1.y = 446;
		
		o_prisonEnemy_2.x = 1702;
		o_prisonEnemy_2.y = 1781;
		
		o_prisonEnemy_3.x = 3603;
		o_prisonEnemy_3.y = 2666;
	} else{
		o_prisonPlayer.x = 3618;
		o_prisonPlayer.y = 2738;
		
		o_prisonEnemy_1.x = 668;
		o_prisonEnemy_1.y = 446;
		
		o_prisonEnemy_2.x = 1702;
		o_prisonEnemy_2.y = 1781;
		
		o_prisonEnemy_3.x = 3356;
		o_prisonEnemy_3.y = 1083;
	}
	
	
}