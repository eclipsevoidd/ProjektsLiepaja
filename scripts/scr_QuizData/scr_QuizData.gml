function save_quiz_data(_filename) {
    var _data = [
        {
            "question": "Kāds Liepājas tilts attēlots?",
            "options": ["Kalpaka tilts", "Tramvaja tilts", "Jaunais tilts", "Gaisa tilts"],
            "answer": 0,
            "image": "s_Tilts"
        },
        {
            "question": "Es esmu jautājums?",
            "options": ["Jā", "Nē", "Varbūt", "Nezinu"],
            "answer": 0,
            "image": "-1"
        },
        {
            "question": "Cik ir 2 + 2?",
            "options": ["3", "4", "5", "Zivs"],
            "answer": 1,
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