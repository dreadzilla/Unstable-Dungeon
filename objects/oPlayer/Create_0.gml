/// @description Init player
xspd=0;
yspd=0;
max_spd=3;
has_key=false;
flash = 0;

enum player {
	moving,
	idle,
	hurt,
	death,
	won
}

state = player.moving;
stepcnt = 0;