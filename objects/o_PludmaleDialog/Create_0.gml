var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [

	"Tas bija jautri, vai ne?",
	"Jautrs fakts - šeit ir atrodami gan īsti dzintari, gan viltotie dzintari. Tos gan labāk neaiztikt.",
	"Es ceru, ka jums bija jautri apmeklēt Liepāju.",
	"Atbrauksim kādu dienu atkal!",
	"...",
	"Paga, kas tie tādi par...",
	"!!!!!!!!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_EndingCutscene_2, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};