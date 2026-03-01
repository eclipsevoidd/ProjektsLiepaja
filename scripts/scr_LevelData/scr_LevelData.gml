function get_level_data(_lv) {
    var _info = {
        target_room: rm_MainMenu,
    };

    switch (_lv) {
        case 0:
            _info.target_room = rm_Katedrals;
			break;
            
        case 1:
            _info.target_room = rm_ConcerHall;
            break;
            
        case 2:
            _info.target_room = rm_KarostasPrisonMiniGame;
            break;
            
        case 3:
            _info.target_room = rm_liepajasRAS_game;
            break;
    }
    
    return _info;
}