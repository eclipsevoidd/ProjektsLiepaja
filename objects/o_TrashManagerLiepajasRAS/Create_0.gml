var itemPool = ds_list_create();

var glass = 5;
var paper = 5;
var plastics = 5;
var metal = 5;

totalTrash = glass + paper + plastics + metal;

repeat (glass) ds_list_add(itemPool, 0);
repeat (paper) ds_list_add(itemPool, 1);
repeat (plastics) ds_list_add(itemPool, 2);
repeat (metal) ds_list_add(itemPool, 3);

ds_list_shuffle(itemPool);

var i = 0; 

with (o_trashItemLiepajasRAS)
{
    var type = itemPool[| i];
    
    switch(type)
    {
        case 0: sprite_index = s_glassLiepajasRAS; break;
        case 1: sprite_index = s_paperLiepajasRAS; break;
        case 2: sprite_index = s_plasticLiepajasRAS; break;
		case 3: sprite_index = s_metalLiepajasRAS; break;
    }
    
    i++;
}

ds_list_destroy(itemPool);