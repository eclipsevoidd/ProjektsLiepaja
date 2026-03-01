var dlg = instance_create_layer(0, 0, "Instances", o_dialogue); //NEAIZTIKT!!!

//Ierakstat savu teikstu šeit ir funkcionalitāte priekš auto wrap
//Sadalat tekstu adekvāti protams 
dlg.dialogue_lines = [
	"Laipni lūdzu jūs Liepājas RAS!",
	"Šeit viņi māca, kā pareizi šķirot atkritumus.",
	"Iesaku arī apstīties spēli \"Šķirošanas banda\", ļoti interesanta spēle ;)",
	"Esmu sarunājis, ka viņi parādīs arī mums kā šķirot atkritumus!",
	"Spēles mērķis ir sašķirot pareizi atkritumus. Lai spēlētu, savāc vienu atkritumu un uzsipiežot TAB tu vari apstīties kur jāmet atkritums.",
	"Jūs varat arī turēt SHIFT lai skrietu!",
	"Pēc tam piespied E lai izmestu atkritumu. Lai veicas!"
	];


dlg.callback_after_dialogue = function() {
    fadeToRoom(rm_liepajasRAS_game, 1, 1); // pirmajā laukā ierakstat uz kuru istabu sūtīsiet, pārējo neaiztikt!
};

