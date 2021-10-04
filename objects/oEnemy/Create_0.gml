/// @description Insert description here
// You can write your code in this editor
depth =-y;

xespd=0;
yespd=0;
max_espd=1.5;
aggrospeed=0.1; //Lower is faster

enemy_distance = 70;

enum enemy {
	moving,
	idle,
	hurting,
	chase
}

eState = enemy.idle;