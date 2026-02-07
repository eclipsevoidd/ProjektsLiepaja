if (!panelState) {
	global.parSpeli = instance_create_depth(75, -1500, 0, o_ParSpeliPanel, 
		{image_xscale: 8, image_yscale: 8, panelID: "parSpeli"});
	panelState = true;
} else {
	instance_destroy(o_ParSpeliPanel);
	panelState = false;
}