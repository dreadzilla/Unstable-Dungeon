/// @description Init player
xspd=0;
yspd=0;
max_spd=3;

enum player {
	moving,
	idle,
	hurt,
	death,
	won
}

state = player.idle;
