pareiza_seciba = [0, 1, 2, 3, 4, 5, 6, 7]; 


global.punkti = 100;

var vadi_list = ds_list_create();
for (var i = 0; i < 8; i++) {
    ds_list_add(vadi_list, i);
}

randomize();
ds_list_shuffle(vadi_list);

var start_x = 735;
var start_y = 735;
var spacing = 60;

for (var i = 0; i < 8; i++) {
    var current_id = vadi_list[| i]; 
    
    var v = instance_create_layer(start_x + (i * spacing), start_y, "Wires", o_Vads);
    
    v.image_index = current_id; 
    v.vada_id = current_id;  
    v.anchor_x = v.x;         
    v.anchor_y = v.y;
}

ds_list_destroy(vadi_list);


