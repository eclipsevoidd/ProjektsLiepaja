function get_level_data(_lv) {
    var _info = {
        target_room: rm_MainMenu,
        description: "Nav, kur doties! :P"
    };

    switch (_lv) {
        case 0:
            _info.target_room = rm_Katedrals;
            _info.description = "katedrāle..."
			break;
            
        case 1:
            _info.target_room = rm_ConcerHall;
            _info.description = "šeit var notiņas spēle=ēt";
            break;
            
        case 2:
            _info.target_room = rm_KarostasPrisonMiniGame;
            _info.description = "CIETUMSrooms"
            break;
            
        case 3:
            _info.target_room = rm_liepajasRAS_game;
            _info.description = "šobrīd ir 5:37am. es nezinu kā es izvilkšu";
            break;
    }
    
    return _info;
}