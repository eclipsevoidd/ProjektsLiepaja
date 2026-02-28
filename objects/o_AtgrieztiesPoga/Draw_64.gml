var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _x1 = gui_x;
var _y1 = gui_y;
var _x2 = gui_x + sprite_width;
var _y2 = gui_y + sprite_height;

if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
    hover_alpha = lerp(hover_alpha, 1.0, 0.1);
    
    if (mouse_check_button_pressed(mb_left) && !instance_exists(o_FadeObject)) {
        fadeToRoom(rm_MainMenu, 1, 1);
		audio_stop_all();
    }
} else {
    hover_alpha = lerp(hover_alpha, 0.6, 0.1);
}

draw_sprite_ext(sprite_index, 0, gui_x, gui_y, 1, 1, 0, c_white, hover_alpha);

draw_set_font(f_FranklinGothicMedLarge);
draw_set_halign(fa_center); // Center the text horizontally
draw_set_valign(fa_top);    // Align from the top of the text down

// 2. Calculate the position
// Use gui_x + (sprite_width/2) to center it under the button
var _text_x = gui_x + (sprite_width / 2); 
var _text_y = gui_y + sprite_height + 10; // 10px padding below the button

// 3. Create the string
// Using string() ensures the numbers are converted to text properly
var _current_lv = string(global.playerProgression);
var _total_lv = "11";
var _display_text = _current_lv + "/" + _total_lv + " vietas apmeklētas";

// 4. Draw the text with a slight shadow for readability
draw_set_color(c_black);
draw_text(_text_x + 2, _text_y + 2, _display_text); // Shadow

draw_set_color(c_white);
draw_text(_text_x, _text_y, _display_text); // Main text

// 5. Reset alignment (Crucial! Otherwise it breaks other UI)
draw_set_halign(fa_left);
draw_set_valign(fa_top);