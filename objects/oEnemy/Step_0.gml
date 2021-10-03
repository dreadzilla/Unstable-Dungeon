/// @description Insert description here
// You can write your code in this editor

switch (eState)
{
	case enemy.idle:
		var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);
		show_debug_message(_dist);
		if (_dist < enemy_distance)
		{
			eState = enemy.chase;	
		}
	break;
	
	case enemy.chase:
		var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);
		var _direction = point_direction(x, y, oPlayer.x, oPlayer.y);
		var _death = instance_find(oEnemy, 0);
		
		_death.speed = max_espd;
		_death.direction = _direction;
		
		if (_dist > enemy_distance)
		{
			_death.speed = 0;
			eState = enemy.idle;
		}
		
	break;
	
	
}
