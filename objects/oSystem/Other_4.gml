/// @description Room start
current_seed = choose(SEEDS.seed_1, SEEDS.seed_2, SEEDS.seed_3);
// Set room to seed.
//random_set_seed(current_seed);

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

var DeathSet = false;
while (!DeathSet)
{
	var death_x = random(GRID_SIZE);
	var death_y = random(GRID_SIZE);
	
	if (death_x != GRID_SIZE/2 && death_y != GRID_SIZE/2)
		if (Grid[# death_x, death_y] == PATH) 
		{
			show_debug_message(death_x);
			show_debug_message(death_y);
			
			instance_create_depth(death_x * CELL_SIZE, death_y * CELL_SIZE, 0, oEnemy);
			//instance_create_layer(death_x * CELL_SIZE, death_y * CELL_SIZE, "Enemy", oEnemy);
			DeathSet = true;
		}
}

// Add walls to environment
//sSystemRoomStartBuild();
//script_execute(sSystemRoomStartBuild);
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
	