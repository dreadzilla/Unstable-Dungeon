/// @description Step

depth =-y;

scrPlayerInput();

xspd = (key_r-key_l) * max_spd;
yspd = (key_d-key_u) * max_spd;

// Collision detect
if (place_meeting(x+xspd,y,oSolid))
{
	while(!place_meeting(x+sign(xspd),y,oSolid))
	{
		x+=sign(xspd);
	}
	xspd=0;
}
x+=xspd;

if (place_meeting(x,y+yspd,oSolid))
{
	while(!place_meeting(x,y+sign(yspd),oSolid))
	{
		y+=sign(yspd);
	}
	yspd=0;
}
y+=yspd;

//move_h = keyboard_check(vk_right) - keyboard_check(vk_left);
//move_v = keyboard_check(vk_down) - keyboard_check(vk_up);

//var tar_x = x div CELL_SIZE + move_h;
//var tar_y = y div CELL_SIZE + move_v;

//if (alarm[0] =-1)
//{
//	alarm[0] = 4;
//	if (oSystem.Grid[# tar_x, tar_y] != VOID)
//	{
//		x = tar_x * CELL_SIZE;
//		y = tar_y * CELL_SIZE;
//	}
//}

//if (oSystem.Grid[# tar_x, tar_y] == DOOR)
//{
//	// Do something when found the door.
//	show_debug_message("Found door!");
//	game_restart();
//}

//if (oSystem.Grid[# tar_x, tar_y] == KEY)
//{
//	// Do something when found the door.
//	show_debug_message("Found key!");
//	oSystem.Grid[# tar_x,tar_y] = 1; // Remove key from world.
//}
