if (showing_text) {

    if (current_line < array_length(dialogue_lines)) {
        var line = dialogue_lines[current_line];
        
        if (typed_letters < string_length(line)) {

            typed_letters = string_length(line);
        } else {

            current_line += 1;
            typed_letters = 0;
        }
    }

    if (current_line >= array_length(dialogue_lines)) {
    showing_text = false;
    

    instance_destroy();
}
}