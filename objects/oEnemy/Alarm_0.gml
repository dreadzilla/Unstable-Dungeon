/// @description Insert description here
// You can write your code in this editor
with(other)
{
	if (oSystem.hp > 0)
	{
		flash=3;
		oSystem.hp--;
		state = player.hurt;
	}
}