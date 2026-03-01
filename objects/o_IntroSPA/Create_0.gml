var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Pārsteigums visiem!",
	"Šis ir Liepājas SPA.",
	"Jautrs fakts šis ir viens no viss modernākajiem SPA visā Kurzemes reģionā!",
	"Spēles mērķis ir noķert visvairāk naudiņas un pīlītes, un jaizvairās no citiem peldētājiem."
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_pool, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

