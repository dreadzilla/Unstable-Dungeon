/// @description Step Event

switch(room)
{
	case rMain:
		scrSystemStepWorld();
		break;
}

/* Debug functions below */

// Restart the game
if (keyboard_check_pressed(vk_escape))
	room_restart();
	
if (keyboard_check(vk_shift) && mouse_check_button_pressed(mb_left))
{
	instance_create_depth(mouse_x, mouse_y, -1, oEnemy);	
	show_debug_message(mouse_x);
}
	
//if (keyboard_check_pressed(vk_shift))
//	show_debug_message(random_get_seed());
if (start_timer == true) {timer = room_speed * hp; start_timer = false;}

if (timer > 0) 
{
	timer--; 
	var hpnew=ceil(timer/room_speed);
	if (hp < hpnew) {
		timer = room_speed * hp;
	} else {
		hp = hpnew;
	}
}

if (timer == 0 && hp == 0)
{
 show_debug_message("You died!");
 
	timer = -1; // This is important, or the timer will trigger every step once it runs out
	with (oPlayer)
	state = player.death;
	audio_play_sound(aRIP,1,0);
}
