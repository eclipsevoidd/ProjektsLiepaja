var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Ceru ka bija intensīvi!",
	"Neviens kāju nav salauzis?",
	"Patiesībā es esmu izbēdzis ārā no šī cietuma, bet tas ir stāsts citai dienai ;)",
	"Ejam talāk!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

