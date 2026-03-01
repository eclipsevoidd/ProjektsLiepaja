function get_level_data(_lv) {
    var _info = {
        target_room: rm_MainMenu,
    };

    switch (_lv) {
        case 0:
            _info.target_room = rm_KatedraleIntro1;
			break;
            
        case 1:
            _info.target_room = rm_PreShowConcertHall
            break;
            
        case 2:
            _info.target_room = rm_PrePool;
            break;
            
        case 3:
            _info.target_room = rm_PreBasketball;
            break;
			
		case 4:
            _info.target_room = rm_liepajasRASIntro;
            break;
			
		case 5:
            _info.target_room = rm_KarostasPrisonIntro;
            break;
			
		case 6:
            _info.target_room = rm_TarzansIntro;
            break;
			
		case 7:
            _info.target_room = rm_ZiemeluFortiIntro;
            break;
			//sitos izdarit
		case 8:
            _info.target_room = rm_LiepajasQuizIntro;
            break;
			
		case 9:
            _info.target_room = rm_RTU;
            break;
			
		case 10:
            _info.target_room = rm_DriftArenaIntro;
            break;
			
		case 11:
            _info.target_room = rm_Map; //rm_EndingCutscene; removed because doesnt exist yet :P
            break;
    }
    
    return _info;
}