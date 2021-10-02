// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrSystemStepWorld(){
	
	if (keyboard_check_pressed(ord("M")))
	{
		display_map = !display_map;
	}

	// Reload new seed
	if (keyboard_check(vk_shift))
	{
		if (keyboard_check_pressed(ord("1")))
		{
			current_seed = SEEDS.seed_1;
			room_restart();
		}
		if (keyboard_check_pressed(ord("2")))
		{
			current_seed = SEEDS.seed_2;
			room_restart();
		}
		if (keyboard_check_pressed(ord("3")))
		{
			current_seed = SEEDS.seed_3;
			room_restart();
		}

	}

}