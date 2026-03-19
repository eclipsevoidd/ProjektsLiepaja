var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Tas bija interesanti, man jāsaka.",
	"Es protams varētu labāk nospēlēt, bet tev arī labi sanāca.",
	"Kādu reizi vajadzētu atkārtot šo.",
	"Ejam tālāk!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

