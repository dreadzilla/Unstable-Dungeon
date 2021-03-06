/// @description Step

//depth =-y;

scrPlayerInput();

xspd = (key_r-key_l) * max_spd;
yspd = (key_d-key_u) * max_spd;

switch(state)   {
	case player.moving:
		if (xspd == 0 && yspd == 0) {
			sprite_index = sPlayer_idle;
		}
		else {
			sprite_index = sPlayer;
		}
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

		// Sound
		if (xspd != 0 || yspd != 0)
		{
			stepcnt += 1;
			if (stepcnt == 15)
			{
				stepcnt = 0;
				p=random_range(.9,1.1);
				audio_sound_pitch(aStep, p);
				audio_play_sound(aStep, 6, false);
			}
		}
		var tar_x = x div CELL_SIZE;
		var tar_y = y div CELL_SIZE;
	
		if (oSystem.Grid[# tar_x, tar_y] == DOOR)
		{
			// Do something when found the door.
			//show_debug_message("Found door!");
			if(oSystem.haskey) 
			{
				show_debug_message("Door opens with key!");
				audio_play_sound(aDoor,1,0);
				oSystem.playerscore++;
				oSystem.haskey=false;
				room_restart();
			}
			//show_debug_message("Key missing!");
		}

		if (oSystem.Grid[# tar_x, tar_y] == KEY)
		{
			// Do something when found the door.
			show_debug_message("Found key!");
			oSystem.haskey=true;
			audio_play_sound(aKey,1,0);
			oSystem.Grid[# tar_x,tar_y] = 1; // Remove key from world.
		}
	break;
	case player.death:
		
		if (alarm[0] < 0) {
			alarm[0] = room_speed*5;
		}
		sprite_index = sPlayer_rip;
		
		
	break;
	
}