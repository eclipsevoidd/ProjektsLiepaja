var itemCIETUMS = ds_list_create();

var iceAmount = 5;
var drinkAmount = 5;
keyAmount = 30 - iceAmount - drinkAmount;

//o_scoreKarostasPrison.totalScore = keyAmount;

repeat (iceAmount) ds_list_add(itemCIETUMS, 0); // ice
repeat (drinkAmount) ds_list_add(itemCIETUMS, 1); // drink
repeat (keyAmount) ds_list_add(itemCIETUMS, 2); // keys

ds_list_shuffle(itemCIETUMS);

var i = 0; 

with (o_itemKarostasPrison)
{
    var type = itemCIETUMS[| i];
    
    switch(type)
    {
        case 0: sprite_index = s_KarostasPrisonIce; break;
        case 1: sprite_index = s_KarostasPrisonDrink; break;
        case 2: sprite_index = s_KarostasPrisonKey_1; break;
    }
    
    i++;
}

ds_list_destroy(itemCIETUMS);
