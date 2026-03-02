var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Wow!!!!!!!!",
	"Iespaidīgi!",
	"Iedomājieties, šīm ērģelēm ir 7000 stabuļu un 131 reģistrs!",
	"Pirmajai aktivitātei nodrošināts, ka varēsim uzspēlēt tās!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Katedrals, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

