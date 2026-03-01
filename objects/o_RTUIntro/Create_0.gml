var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Es atceros šo vietu it kā tā būtu vakardien...",
	"Šeit es mācijos, kad biju jaunāks, tagad tā ir tikai Rīgas tehniskās universitātes Liepājas koledža.",
	"Manos laikos tā bija zināma kā Liepājas Universitāte.",
	"Esmu sarunājis mums privātu lekciju, ejam!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_RTU, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

