//dabū laiku
dt = delta_time / 1000000;
timer += dt;

if(o_timerConcertHall.timer >= 5){
	
	if(o_timerConcertHall.timer < 60 - (spawningIntensity * 100) && spawningIntensity <= 0.5)
		spawningIntensity += 0.1;
		
	if(timer >= irandom_range(1, 4) - spawningIntensity && gameStarted){
	
		//ģenerē y kordinātu no dotā saraksta
		var indexY = irandom(array_length(notePos) - 1);
		var randY =  notePos[indexY].note_y;
	
	
		//izveido objektu
		note = instance_create_depth(2000, randY, 0, o_songLetter);
	
		//pievieno burtu kas būs jāspiež un izskatu
		var indexPicked = irandom(array_length(noteData) - 1);

		note.sprite_index = noteData[indexPicked].sprite;
	
		note.pickedLetter = noteData[indexPicked].action;
	
		timer = 0;
	}
}