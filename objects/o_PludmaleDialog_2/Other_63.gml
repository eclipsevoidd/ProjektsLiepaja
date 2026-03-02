if (async_load[? "id"] == name_dialog_id)
{
    var _name = async_load[? "result"]; // IMPORTANT

    if (_name != undefined && _name != "")
        global.player_name = _name;
    else
        global.player_name = "Spēlētājs";

    name_dialog_id = -1;

    show_debug_message("FINAL NAME: " + global.player_name);

    scr_finalize_player();
    fadeToRoom(rm_MainMenu, 1, 1);
}