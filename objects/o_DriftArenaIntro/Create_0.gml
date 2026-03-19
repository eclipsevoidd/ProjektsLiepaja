var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Tagad, mūsu atvadīšanās aktivitāte - pabraukājam ar mašīnām!",
	"Spēles mērķis ir izbraukt trasi tik ātri, cik vien vari un neietriekties sienās.",
	"Jautrs faktgs - vai tu zināji, ka Drift Arenā tika filmēts Bermudu Divstura mūzikas video?"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(DriftArena, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

