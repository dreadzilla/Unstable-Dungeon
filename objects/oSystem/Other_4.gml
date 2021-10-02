/// @description Room start

// Set room to seed.
random_set_seed(current_seed);

// Create grid
Grid = ds_grid_create(GRID_SIZE, GRID_SIZE);
var path_x=GRID_SIZE/2;
var path_y=GRID_SIZE/2;

// Spawn player
instance_create_depth(path_x * CELL_SIZE, path_y * CELL_SIZE, -1, oPlayer);

// Generate path
repeat(PATH_SIZE)
{
	Grid[# clamp(path_x,1, GRID_SIZE-2), clamp(path_y, 1, GRID_SIZE-2)]	= PATH;
	switch( choose( "Right", "Up", "Left", "Down") )
	{
		case "Right":
			path_x++;
			break;
		case "Left":
			path_x--;
			break;
		case "Up":
			path_y--;
			break;
		case "Down":
			path_y++;
			break;
	}
}

var DoorSet = false;
while (!DoorSet)
{
	var door_x = random(GRID_SIZE);
	var door_y = random(GRID_SIZE);
	
	if (door_x != GRID_SIZE/2 && door_y != GRID_SIZE/2)
		if (Grid[# door_x, door_y] == 1) 
		{
			Grid[# door_x,door_y] = 2;	
			DoorSet = true;
		}
}