function scr_PrisonTileSetWallCollision(_x, _y){
	return tilemap_get_at_pixel(ts_prisonWallTileSet, _x, _y) != 0; 
}