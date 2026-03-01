var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Apstāsimies šeit uz kādu laiciņu...",
	"Hmmm...",
	"Laiks atbildēt uz jautājumiem!",
	"Es ceru, ka tu iegaumeji faktus!",
	"Starp citu, šī būs daļa no jūsu atzīmes! ;)"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_LiepajaQuiz, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

