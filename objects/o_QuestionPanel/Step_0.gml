if (animate) {
    if (panelOpen == false) {
        image_xscale = lerp(image_xscale, 1, 0.2);
        
        if (image_xscale > 0.999) {
            image_xscale = 1;
            panelOpen = true;
            animate = false;
        }
    } else {
        image_xscale = lerp(image_xscale, 0, 0.2);
        
        if (image_xscale < 0.001) {
			image_xscale = 0;
			panelOpen = false;
			animate = false;

			if (global.state == quizState.Game) {
		        global.CIETUMS_index += 1;
		        if (global.CIETUMS_index >= ds_list_size(global.question_CIETUMS)) {
		            ds_list_shuffle(global.question_CIETUMS);
		            global.CIETUMS_index = 0;
		        }
		        global.current_index = global.question_CIETUMS[| global.CIETUMS_index];
		        global.jautajums = global.quizJautajumi[global.current_index];

		        with(o_QuizButton) image_blend = c_white;
		        animate = true; 
		    }
        }
    }
}

image_alpha = lerp(image_alpha, global.panel_alpha, 0.1);