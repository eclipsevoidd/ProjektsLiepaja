function save_quiz_data(_filename) {
    var _data = [
        {
            "question": "Kāds Liepājas tilts attēlots?",
            "options": ["Kalpaka tilts", "Tramvaja tilts", "Jaunais tilts", "Gaisa tilts"],
            "answer": 0,
            "image": "s_Tilts"
        },
        {
            "question": "Cik apmeklējuma vietas spēlē?",
            "options": ["6", "7", "10", "11"],
            "answer": 3,
            "image": "-1"
        },
        {
            "question": "Kas attēlots bildē?",
            "options": ["Lielā Koncertzāle", "Lielais Dzintars", "Liepājas Dzintars", "Liepājas Koncertzāle"],
            "answer": 1,
            "image": "s_Dzintars"
        },
		{
            "question": "Liepājā ir Latvijas vecākā...",
            "options": ["Autobusu līnija", "Pilsēta", "Tramvaja līnija", "Izglītības iestāde"],
            "answer": 2,
            "image": "-1"
        },
		{
            "question": "Katedrāles ērģelēm ir...",
            "options": ["7000 stabuļu", "6800 stabuļu", "5430 stabuļu", "9000 stabuļu"],
            "answer": 0,
            "image": "-1"
        },
		{
            "question": "Liepājas SPA ir modernākais...",
            "options": ["Valstī", "Vidzemes reģionā", "Latgales reģionā", "Kurzemes reģionā"],
            "answer": 3,
            "image": "-1"
        },
		{
            "question": "LOC komplekss ir... garš.",
            "options": ["18 000 m2", "16 000 m2", "3000 m2", "20 000 m2"],
            "answer": 0,
            "image": "s_LOC"
        },
		{
            "question": "Liepājas šķirošanas kompānija",
            "options": ["Liepājas Musars", "Kurzeme Šķiro", "Liepājas RAS", "Liepājas Šķirotava"],
            "answer": 2,
            "image": "-1"
        },
		{
            "question": "Liepājas cietums atrodas...",
            "options": ["Centrā", "Vecliepājā", "Lauku ielā", "Karostā"],
            "answer": 3,
            "image": "-1"
        },
		{
            "question": "Ziemeļu Fortus reiz sauca...",
            "options": ["Cietokšņa baterija", "Dienvidu Forti", "PSRS Forti", "Liepājas Forti"],
            "answer": 0,
            "image": "-1"
        }
    ];

    var _string = json_stringify(_data);
    var _file = file_text_open_write(_filename);
    file_text_write_string(_file, _string);
    file_text_close(_file);
}

function load_quiz_data(_filename) {
    if (!file_exists(_filename)) {
        save_quiz_data(_filename);
    }

    var _file = file_text_open_read(_filename);
    var _json_string = "";
    while (!file_text_eof(_file)) {
        _json_string += file_text_read_string(_file);
    }
    file_text_close(_file);

    return json_parse(_json_string);
}