if (panelOpen == false) {
	if (variable_global_exists("quizJautajumi")) {
	    global.current_index = irandom(array_length(global.quizJautajumi) - 1);
	    global.jautajums = global.quizJautajumi[global.current_index];
	}
}
animate = true;
