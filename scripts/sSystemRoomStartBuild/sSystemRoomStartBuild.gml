// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sSystemRoomStartBuild(){
	for (var xx = 0; xx < GRID_SIZE; xx++)
	{
		for (var yy = 0; yy < GRID_SIZE; yy++)
		{
			// Wall stuff	
			if(Grid[# xx, yy] == VOID)
			{
				var make_wall = false;

				if(yy < GRID_SIZE-1 && xx < GRID_SIZE) {
					if (Grid[# xx, yy+1] <= PATH || Grid[# xx, yy+1] == KEY || Grid[# xx, yy+1] == DOOR)
					{
						make_wall = true;
						//show_debug_message("wall");
					}
				}
				if(make_wall)
				{
					instance_create_depth(xx*CELL_SIZE,yy*CELL_SIZE, depth+1, oWall);
				}
			}
		}
	}
}