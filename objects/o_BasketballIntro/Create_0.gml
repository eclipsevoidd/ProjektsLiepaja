var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Nekur tālu neesam aizgājuši.",
	"Šis ir Liepājas Olimpiskā centra komplekss.",
	"Interesants fakts - šis komplekss ir aptuveni 18 000 kvadrātmetrus plats.",
	"Šīs spēles mērķis ir trāpīt ienaidnieka grozā ar basketbola bumbu.",
	"Labu veiksmi!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(Basketboll, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

