var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Ak, kā vecajos labajos laikos...",
	"Tagad jau viss tāpat, tikai ar datoriem un telefoniem!",
	"Labi, dosimies uz pēdējo apskates vietu.",
	"Tā būs ļoti izglītojoša."
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

