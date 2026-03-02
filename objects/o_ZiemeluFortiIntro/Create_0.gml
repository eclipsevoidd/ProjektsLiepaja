var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Sveicināti Ziemeļu fortos!",
	"Šīs vietas vēsturiskais nosaukums bija Cietokšņa baterija Nr. 1.",
	"Šeit arī piedāvā spēli - ",
	"Bēgšana no PSRS!",
	"Šeit mēs pārbaudīsim vai jūs varat atraidīt ienaidniekus, kuri šeit tev uzbruktu!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(ZiemeluForti, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

