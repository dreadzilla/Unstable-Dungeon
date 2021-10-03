/// @description Step

depth =-y;

draw_self();
if (flash > 0)
{
	flash--;
	image_blend = make_color_rgb(250,120,120);
	draw_self();
	image_blend = make_color_rgb(255,255,255);
	//show_debug_message("flash");
	
	//repeat (irandom_range(9,15)) {
	//	var random_x = irandom_range(-8,8);
	//	var random_y = irandom_range(-8,8);
	
	//	var particle = instance_create_layer(x + random_x, y + random_y, "Bullets", oParticle);
	//	particle.image_blend = c_white;
	//	particle.image_speed = .5;
	//	//particle.image_xscale += 1;
	//    //particle.image_yscale += 1;
	//	particle.gravity = 0;
	//	particle.speed = 2;
	//}
}

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