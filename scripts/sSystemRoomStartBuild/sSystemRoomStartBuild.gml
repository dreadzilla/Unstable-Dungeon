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
				// Check if PATH is on row below
				//for (var ii = xx-1; ii < xx +3;ii++)
				//{
				//	for (var jj = yy-1;jj<yy+3;jj++)
				//	{
				//		if (ii >= 0 &&
				//		    ii<GRID_SIZE &&
				//			jj >=0 &&
				//			jj<GRID_SIZE)
				//			{
				//				if (Grid[# ii,jj] == PATH)
				//				{
				//					make_wall=true;
				//				}
				//			}
				//	}
				//}
				if(yy < GRID_SIZE && xx < GRID_SIZE) {
					show_debug_message("hej");	
					if (Grid[# xx, yy+1] <= PATH || Grid[# xx, yy+1] == KEY || Grid[# xx, yy+1] == DOOR)
					{
						make_wall = true;
						show_debug_message("wall");
					}
				}
				//	else if (oSystem.Grid[# xx, yy-1] == PATH)
				//	{
				//		make_wall = true;
				//	}
				//	else if (oSystem.Grid[# xx-1, yy] == PATH)
				//	{
				//		make_wall = true;
				//	}
				//	else if (oSystem.Grid[# xx+1, yy] == PATH)
				//	{
				//		make_wall = true;
				//	}
				//}
				if(make_wall)
				{
					instance_create_depth(xx*CELL_SIZE,yy*CELL_SIZE, depth-1, oWall);
				}
				
			}
		}
	}
}