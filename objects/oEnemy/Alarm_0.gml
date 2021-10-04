/// @description Insert description here
// You can write your code in this editor
with(other)
{
	if (oSystem.hp > 0)
	{
		flash=3;
		oSystem.hp--;
		var _makesound = choose(true, false, false);
		if (_makesound)
			audio_play_sound(aHurt,1,0);
	}
}