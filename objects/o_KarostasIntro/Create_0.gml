var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Šis ir Karostas cietums",
	"No šī cietuma neviens nekad nav izbēdzis, līdz šim, jo jūsu uzdevums būs mēģināt izbēgt ārā no šī cietuma",
	"Spēlē jums ir jātrod vairākas atslēgas kuras ir paslēptas cietumā",
	"Jums pakaļ skries policisti no kuriem jums būs jaizvairas, tev būs 3 dzīvības",
	"Tu vari arī šajā spēlē skriet tu arī atradīsi lietas kas tev var palīdzēt šajā piedzīvojumā!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_KarostasPrisonMiniGame, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

