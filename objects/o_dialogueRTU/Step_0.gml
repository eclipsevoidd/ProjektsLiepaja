if (showing_text && current_line < array_length(dialogue_lines)) {
    var line = dialogue_lines[current_line];
    
    // Type letters over time
    if (typed_letters < string_length(line)) {
        typed_letters += typing_speed;
        if (typed_letters > string_length(line)) typed_letters = string_length(line);
    }
}