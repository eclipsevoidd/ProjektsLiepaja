var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = ["Mostieties visi!",
	"Drīz iebrauksim Liepājā!",
	"Šodien mēs visas dienas garumā apskatīsim vienpadsmit vietas.",
	"Atceraties ka šī ir mācību ekskursija tā dēļ nevarēsiet visu laiku tikai izklaidēties, bet būs arī jāmācās!",
	"Tas man atgādina ka man jums ir jāpasaka jautrs fakts par Liepāju! Vai jūs zinājāt ka Liepājā ir vecākā elektriskā tramvaja līnija visā Latvijā?",
	"Tā ir aptuveni 15 kilometrus gara, diezgan iespaidīgi ne?",
	"Rekur drīz apstāsimies pie..."
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_Map, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

