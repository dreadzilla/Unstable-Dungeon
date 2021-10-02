/// @description Step Event

switch(room)
{
	case rMain:
		scrSystemStepWorld();
		break;
	case rDungeon:
		scrSystemStepDungeon();
		break;
}

/* Debug functions below */

// Restart the game
if (keyboard_check_pressed(vk_escape))
	game_restart();
	
//if (keyboard_check_pressed(vk_shift))
//	show_debug_message(random_get_seed());
