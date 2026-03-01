var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Priekš mūsu atvadīšanās aktivitātes - pabraukājam ar mašīnām!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(DriftArena, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

