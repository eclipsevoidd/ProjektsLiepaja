randomize();

global.quizJautajumi = ["Kāds Liepājas tilts attēlots?", "Es esmu jautājums?", "Cik ir 2 + 2?"];
global.opcijas = [
    ["Akmens tilts", "Oskara Kalpapa Tilts", "Vanšu tilts", "Novickas tilts"],
    ["Jā", "Nē", "Varbūt", "Intars Voitkevičs"],
    ["3", "4", "5", "Zivs"]
];
global.quizBildes = [
    s_Tilts,
    -1,
    -1
];

global.current_index = irandom(array_length(global.quizJautajumi) - 1);

global.jautajums = global.quizJautajumi[global.current_index];
global.panel_alpha = 1;