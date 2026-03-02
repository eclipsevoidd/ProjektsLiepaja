var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Paldies ka spēlēji mūsu spēli! - Gustavs, Viktors un Rodrigo.",
	"Ceram ka izbaudiji :)",
	"--Sasniegumi--",
	"Tavi punkti: " + string(scr_get_total_score()),
    "Tavs spēles laiks: " + scr_format_time(global.playTime)
	];


dlg.callback_after_dialogue = function() {
	scr_finalize_player();
    fadeToRoom(rm_MainMenu, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};