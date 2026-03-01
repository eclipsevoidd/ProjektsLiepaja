var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Pārsteigums visiem!",
	"Šis ir Liepājas SPA.",
	"Jautrs fakts šis ir viens no viss modernākajiem SPA visā Kurzemes reģionā!",
	"Spēles mērķis ir tikt ārā no baseina pirms laiks beidzas."
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_pool, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

