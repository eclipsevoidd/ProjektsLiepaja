var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Atceros šo vietu kā vakardienu",
	"Šeit es arī mācijos kad biju jaunāks, tagad tā ir tikai Rīgas tehniskās universitātes Liepājas koledža, manos laikos tā bija zināma kā Liepājas Universitāte.",
	"Esmu sarunājis mums privātu lekciju, kurā mums būs neliels ieskats uz Datorzinātnēm, ejam!",
	"Spēlē būs jasaliek RJ45 Ethernet kabeli, nospiežot TAB var 1 reizi meginājumā apskatīt špikeri"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_RTU, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

