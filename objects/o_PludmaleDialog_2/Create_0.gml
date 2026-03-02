name_dialog_id = -1;
name_entered = false;

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
    name_dialog_id = get_string_async("Ievadi savu vārdu:", "");
};