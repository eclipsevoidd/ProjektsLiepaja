//Pmaācība ņemta not youtube
//https://www.youtube.com/watch?v=5rB_s5obapc
function maze(_style,_width,_height) constructor {
	grid = 0;
	style = _style;
	w = _width;
	h = _height;
	startPoint = [0,0];
	endPoint = [w-1,h-1];
	
	for (var i = 0; i < w; i++) {
		for (var j = 0; j < h; j++) {
			grid[i][j] = new maze_grid_space();
		}
	}
}

function maze_grid_space() constructor {
	visited = false;
	right = true;
	down = true;
}

function maze_generate(_mazeStruct) {
	var branches = ds_stack_create();
	var g = _mazeStruct.grid;
	var cp = [_mazeStruct.startPoint[0],_mazeStruct.startPoint[1]];
	g[cp[0]][cp[1]].visited = true;
	ds_stack_push(branches,cp);
	
	//Loop until the ds_stack is empty
	while(!ds_stack_empty(branches)) {
		//Read the top of the stack
		cp = ds_stack_top(branches);
		//Gather the potential directions to move
		var pdir = ds_list_create();
		if (cp[0] > 0 && !g[cp[0]-1][cp[1]].visited)				ds_list_add(pdir,[cp[0]-1,cp[1]]);
		if (cp[0] < _mazeStruct.w-1 && !g[cp[0]+1][cp[1]].visited)	ds_list_add(pdir,[cp[0]+1,cp[1]]);
		if (cp[1] > 0 && !g[cp[0]][cp[1]-1].visited)				ds_list_add(pdir,[cp[0],cp[1]-1]);
		if (cp[1] < _mazeStruct.h-1 && !g[cp[0]][cp[1]+1].visited)	ds_list_add(pdir,[cp[0],cp[1]+1]);
		//CHeck if pdir is empty
		if (ds_list_empty(pdir)) {
			ds_stack_pop(branches);
		} else {
			var np = 0;
			switch(_mazeStruct.style) {
				case 0:
					ds_list_shuffle(pdir);
					np = pdir[| 0];
					show_debug_message("Shuffled");
				break;
				default:
				
				break;
			}
			g[np[0]][np[1]].visited = true;
			ds_stack_push(branches,np);
			
			//Determine which walls to break
			if (np[0] > cp[0]) g[cp[0]][cp[1]].right = false;
			if (np[0] < cp[0]) g[np[0]][np[1]].right = false;
			if (np[1] > cp[1]) g[cp[0]][cp[1]].down = false;
			if (np[1] < cp[1]) g[np[0]][np[1]].down = false;
		}
		ds_list_destroy(pdir);
	}
	ds_stack_empty(branches);
}

function draw_maze(_mazeStruct,_cellSize,_xOffset,_yOffset) {
	var m = _mazeStruct;
	var s = _cellSize;
	var xx = _xOffset;
	var yy = _yOffset;
	var sp = _mazeStruct.startPoint;
	var ep = _mazeStruct.endPoint;
	
	draw_set_colour(make_colour_rgb(53, 56, 54))
	draw_set_alpha(0.8);
	draw_rectangle(xx, yy, xx + m.w * s, yy + m.h * s, false)
	
	draw_set_color(c_red);
	draw_rectangle(s*sp[0]+xx,s*sp[1]+yy,s*(sp[0]+1)+xx,s*(sp[1]+1)+yy,false);
	draw_rectangle(s*ep[0]+xx,s*ep[1]+yy,s*(ep[0]+1)+xx,s*(ep[1]+1)+yy,false);
	draw_set_color(c_white);
	
	for (var i = 0; i < m.w; i++) {
		for (var j = 0; j < m.h; j++) {
			if (i == 0)					draw_line(0+xx,j*s+yy,0+xx,(j+1)*s+yy);
			if (j == 0)					draw_line(s*i+xx,0+yy,s*(i+1)+xx,0+yy);
			if (m.grid[i][j].right)		draw_line(s*(i+1)+xx,s*j+yy,s*(i+1)+xx,s*(j+1)+yy);
			if (m.grid[i][j].down)		draw_line(s*i+xx,s*(j+1)+yy,s*(i+1)+xx,s*(j+1)+yy);
		}
	}
}





















