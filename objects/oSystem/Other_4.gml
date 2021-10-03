/// @description Room start

// Set room to seed.
random_set_seed(current_seed);

// Create grid
Grid = ds_grid_create(GRID_SIZE, GRID_SIZE);
var path_x=GRID_SIZE/2;
var path_y=GRID_SIZE/2;

// Spawn player
instance_create_depth(path_x * CELL_SIZE + CELL_SIZE/2, path_y * CELL_SIZE + CELL_SIZE/2, -1, oPlayer);

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

// Place door
var DoorSet = false;
while (!DoorSet)
{
	var door_x = random(GRID_SIZE);
	var door_y = random(GRID_SIZE);
	
	if (door_x != GRID_SIZE/2 && door_y != GRID_SIZE/2)
		if (Grid[# door_x, door_y] == PATH) 
		{
			Grid[# door_x,door_y] = DOOR;	
			DoorSet = true;
		}
}
// Place key
var KeySet = false;
while (!KeySet)
{
	var key_x = random(GRID_SIZE);
	var key_y = random(GRID_SIZE);
	
	if (key_x != GRID_SIZE/2 && key_y != GRID_SIZE/2)
		if (Grid[# key_x, key_y] == PATH) 
		{
			Grid[# key_x,key_y] = KEY;	
			KeySet = true;
		}
}

// Add walls to environment
sSystemRoomStartBuild();
