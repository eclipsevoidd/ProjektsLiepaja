var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Tas bija grūti",
	"Ceru ka jums bija jautri",
	"Laiks doties tālāk!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

