var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

instance_destroy(o_Enemy);

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Pffffff",
	"Savā jaunībā es biju sportiskāks nekā jūs, bet nulabi",
	"Laiks tālāk doties!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

