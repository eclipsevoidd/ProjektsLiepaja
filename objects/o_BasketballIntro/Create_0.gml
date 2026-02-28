var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Tālu nēsam aizgājuši.",
	"Šis ir Liepājas Olimpiskā centra komplekss.",
	"Interesants fakts ir komplekss ir aptuveni 18 000 kvadrātmetrus plats.",
	"Spēles mērķis ir trāpīt ienaidnieka grozā"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(Basketboll, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

