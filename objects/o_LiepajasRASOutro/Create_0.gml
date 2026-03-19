var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Ceru, ka jūs esat kaut ko jaunu iemācijušies!",
	"Tagad laiks braukt uz ļoti biedējošu vietu.",
	"...",
	"Es cerēšu, ka maiņas drēbes jums ir, jo man ir!",
	"Jums nav?",
	"..................",
	"Nekas, ejam tālāk!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

