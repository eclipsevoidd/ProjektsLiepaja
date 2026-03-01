var kluudas = 0;
var visi_salikti = true;
var player_result = array_create(8, -1);

with (o_Slot) {
    player_result[slot_index] = occupant;
    if (occupant == -1) visi_salikti = false;
}

if (!visi_salikti) {
    var dlg = instance_create_layer(0, 0, "Instances", o_dialogueRTU);
    dlg.dialogue_lines = ["Saliec visus vadiņus!"];
} else {
    if (instance_exists(o_RTU_GameManager)) {
        var target_seq = o_RTU_GameManager.pareiza_seciba;
        
        for (var i = 0; i < 8; i++) {
            
            if (player_result[i] != target_seq[i]) {
                kluudas++;
            }
        }
        if (kluudas == 0) {
            var dlg = instance_create_layer(0, 0, "Instances", o_dialogueRTU);
            dlg.dialogue_lines = [
                "Pareizi! T568B standarts izpildīts.",
                "Saņemti " + string(global.punkti) + " punkti.",
                "Laiks doties tālāk!"
            ];
            // room_goto_next();
        } else {
            global.punkti -= 10;
            if (global.punkti < 0) global.punkti = 0;
            var dlg = instance_create_layer(0, 0, "Instances", o_dialogueRTU);
            dlg.dialogue_lines = [
                "Nepareizi! Ir " + string(kluudas) + " kļūdas.",
                "Tev atņemti 10 punkti.",
                "Pamēģini vēlreiz!"
            ];
        }
    }
}