var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Šī ir mūsu pirmā apmeklējuma vieta - ",
	"Liepājas Svētā Trīsvienības Katedrāle!",
	"Ļoti skaista vieta.",
	"Ieejam iekšā visi, bet tikai klusi!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_KatedraleIntro2, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

