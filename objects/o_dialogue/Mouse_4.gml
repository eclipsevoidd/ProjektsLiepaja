if (showing_text) {
    // Only access the line if we're still within the array
    if (current_line < array_length(dialogue_lines)) {
        var line = dialogue_lines[current_line];
        
        if (typed_letters < string_length(line)) {
            // Finish typing immediately
            typed_letters = string_length(line);
        } else {
            // Move to next line
            current_line += 1;
            typed_letters = 0;
        }
    }

    // If we went past the last line, hide or destroy dialogue
    if (current_line >= array_length(dialogue_lines)) {
        showing_text = false;
        // instance_destroy(); // optional
    }
}