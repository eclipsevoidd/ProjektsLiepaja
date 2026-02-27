if (showing_text && current_line < array_length(dialogue_lines)) {

    // 1️⃣ Draw the object’s sprite first
    if (sprite_index != -1) {
        draw_sprite(sprite_index, image_index, x, y);
    }


    // 3️⃣ Draw the wrapped text
    draw_set_font(f_FranklinGothicDialogue); // your font
    draw_set_color(c_white);

    var line = dialogue_lines[current_line];
    var to_draw = string_copy(line, 1, typed_letters);

    draw_text_ext(
        x + text_offset_x,          // X position inside sprite
        y + text_offset_y,          // Y position inside sprite
        to_draw,                    // text string
        56,                         // line height in pixels
        sprite_width - 2*text_offset_x // wrap width inside sprite
    );
}