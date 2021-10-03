/// @description Draw Mini map

if (display_map == true)
{
	var mm_size = 200;
	var mm_cell = mm_size/GRID_SIZE;
	
	// Draw minimap
	draw_set_color(c_dkgray);
	draw_rectangle(0,0,mm_size,mm_size,false);
	
	for (var ii = 0; ii < GRID_SIZE; ii++)
	{
		for (var jj = 0; jj < GRID_SIZE; jj++)
		{
			if (Grid[# ii, jj] == PATH)
			{
				draw_set_color(c_green);
				draw_rectangle(mm_cell*ii,
								mm_cell*jj,
								mm_cell*ii+mm_cell-1,
								mm_cell*jj+mm_cell-1,
								0);
			}
		}
	}
	// Draw player
	draw_set_color(c_yellow);
	var player_x = mm_cell*oPlayer.x div CELL_SIZE;
	var player_y = mm_cell*oPlayer.y div CELL_SIZE;
	draw_rectangle( player_x,
					player_y,
					player_x + mm_cell -1,
					player_y + mm_cell -1,
					0);
	// Draw camera Box
	draw_set_color(c_gray);
	var view_size = room_width / camera_get_view_width(view_camera[0]);
	view_size = mm_size / view_size;
	view_size *= 0.5;
	
	var view_x = clamp( player_x,
						view_size,
						mm_size - view_size);
					
	var view_y = clamp( player_y,
						view_size,
						mm_size - view_size);	
						
	draw_rectangle( view_x - view_size,
					view_y - view_size,
					view_x + view_size,
					view_y + view_size,
					1);
	
	
}

	
// Draw score
draw_set_font(fScore);
draw_set_halign(fa_left);
draw_text_color(200 + 100+1, 5+1, "Score: " + string(playerscore), c_black, c_black, c_black, c_black, 1);
draw_text_color(200 + 100, 5, "Score: " + string(playerscore), c_white, c_white, c_white, c_white, 1);

draw_text_color(300 + 100+1, 5+1, "Key: " + string(haskey), c_black, c_black, c_black, c_black, 1);
draw_text_color(300 + 100, 5, "Key: " + string(haskey), c_white, c_white, c_white, c_white, 1);


draw_text_color(400 + 100+1, 5+1, "Health: " + string(hp), c_black, c_black, c_black, c_black, 1);
draw_text_color(400 + 100, 5, "Health: " + string(hp), c_white, c_white, c_white, c_white, 1);

