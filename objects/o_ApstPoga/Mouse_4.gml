 var kluudu_skaits = 0;
var visi_salikti = true;

var player_attempt = array_create(8, -1); 

// 2. Loop through every slot in the room
with (obj_slot) {

    player_attempt[slot_index] = occupant;
    if (occupant == -1) visi_salikti = false;
}

// 3. Check if everything is filled
if (!visi_salikti) {
    show_message("Tu vēl neesi pabeidzis! Visiem 8 kontaktiem jābūt aizpildītiem.");
    exit; // Stop the code here
}

// 4. Compare player attempt to the correct T568B sequence
// Correct: [Or-Wh, Or, Gr-Wh, Bl, Bl-Wh, Gr, Br-Wh, Br]
var correct_sequence = [0, 1, 2, 3, 4, 5, 6, 7]; 

for (var i = 0; i < 8; i++) {
    if (player_attempt[i] != correct_sequence[i]) {
        kluudu_skaits++;
    }
}

// 5. Final Result
if (kluudu_skaits == 0) {
    show_message("Lieliski! RTU Liepājas inženieri ir lepni par Tevi.");
    global.punkti += 100;
    // Go back to map or next level
} else {
    global.punkti -= 10;
    show_message("Kaut kas nav kārtībā... Vadi nav pareizajā secībā! -10 punkti.");
}