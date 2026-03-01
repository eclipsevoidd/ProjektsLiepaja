persistent = false;
instance_destroy(o_TarzanManager);

var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Ceru ka jums vēl ir spēks!",
	"Tagad mums jādodas uz ļoti interesantu vietu. "
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

