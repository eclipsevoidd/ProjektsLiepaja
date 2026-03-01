// Detect directional presses (arrows OR WASD)
var pressUp    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var pressDown  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var pressLeft  = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var pressRight = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));


if ((pressUp    && pickedLetter != "VK_UP")   ||
    (pressDown  && pickedLetter != "VK_DOWN") ||
    (pressLeft  && pickedLetter != "VK_LEFT") ||
    (pressRight && pickedLetter != "VK_RIGHT")) {
    
    o_scoreConcertHall.totalScore -= 1;

    var audioToPlay = incorrectKey[irandom(array_length(incorrectKey) - 1)];
    audio_play_sound(audioToPlay, 50, false, 0.20);

    fading = true;
}


if (!inputLocked) {

    if ((pickedLetter == "VK_UP"    && pressUp)   ||
        (pickedLetter == "VK_DOWN"  && pressDown) ||
        (pickedLetter == "VK_LEFT"  && pressLeft) ||
        (pickedLetter == "VK_RIGHT" && pressRight)) {

        o_scoreConcertHall.totalScore += 1;

        inputLocked = true;
        fading = true;
    }
}