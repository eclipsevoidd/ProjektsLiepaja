ds_list_destroy(global.question_pool);
ds_map_destroy(global.sprite_map);

draw_set_halign(fa_left);
draw_set_valign(fa_left);

scr_submit_score(GAME.QUIZ, global.punkti);
completeMinigame(GAME.QUIZ);