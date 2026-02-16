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
        }
    }
}

image_alpha = lerp(image_alpha, global.panel_alpha, 0.1);