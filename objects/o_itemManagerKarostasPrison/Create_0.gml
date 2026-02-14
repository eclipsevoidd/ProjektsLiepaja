var itemPool = ds_list_create();

var iceAmount = 2;
var drinkAmount = 2;
keyAmount = 30 - iceAmount - drinkAmount;

o_scoreKarostasPrison.totalScore = 30;

repeat (iceAmount) ds_list_add(itemPool, 0); // ice
repeat (drinkAmount) ds_list_add(itemPool, 1); // drink
repeat (keyAmount) ds_list_add(itemPool, 2); // keys

ds_list_shuffle(itemPool);

var i = 0;

with (o_itemKarostasPrison)
{
    var type = itemPool[| i];
    
    switch(type)
    {
        case 0: sprite_index = s_KarostasPrisonIce; break;
        case 1: sprite_index = s_KarostasPrisonDrink; break;
        case 2: sprite_index = s_KarostasPrisonKey_1; break;
    }
    
    i++;
}

ds_list_destroy(itemPool);
