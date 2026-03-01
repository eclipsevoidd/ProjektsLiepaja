var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Tā, šī ir nākamā pieturvieta.",
	"Šī ir Liepājas koncertzāle Lielais Dzintars, uzcelta 2015 gadā.",
	"Šī ir viena no manām mīļākajām koncertzālēm.",
	"Šeit arī ir teātris, kuru vietējie iedzīvotāji apmeklē.",
	"Tagad visi man sekojat mums būs privāts koncerta mēģinājums, kuru varēsim visi noklausīties.",
	"Man arī ir jāpārģērbjas.",
	"Lai spēlētu spēli tev vajadzēs izmantot bultiņtaustiņus un nospiest tos kad tie ieiet zaļajā laukumā."
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_ConcerHall, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

