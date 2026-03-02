var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Sveicu jūs Tarzānā!",
	"Šeit mēs pārbaudīsim vai jūs varat kļut par īstiem tarzāniem!",
	"(Neviens vēl nav kļuvis par Tarzānu...)",
	"(Izņemot mani protams)"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Tarzans, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

