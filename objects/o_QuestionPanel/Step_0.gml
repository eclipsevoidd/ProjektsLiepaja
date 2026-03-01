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
		        global.pool_index += 1;
		        if (global.pool_index >= ds_list_size(global.question_pool)) {
		            ds_list_shuffle(global.question_pool);
		            global.pool_index = 0;
		        }
		        global.current_index = global.question_pool[| global.pool_index];
		        global.jautajums = global.quizJautajumi[global.current_index];

		        with(o_QuizButton) image_blend = c_white;
		        animate = true; 
		    }
        }
    }
}

image_alpha = lerp(image_alpha, global.panel_alpha, 0.1);