/// @description Insert description here
// You can write your code in this editor

if (state == player.death)
{
	draw_set_halign(fa_center);
	draw_set_font(fTitle);
	draw_text_color(640/2 + 1, (640/3) + 1, "You died!", c_black, c_black, c_black, c_black, 1);
	draw_text_color(640/2, (640/3), "You died!", c_white, c_white, c_white, c_white, 1);
	
	curtime = string(alarm[0] div room_speed);
	
	draw_set_font(fStart);
	draw_text_color(640/2 + 1, 640 - (640/2) + 21, "Restarting in " + curtime, c_black, c_black, c_black, c_black, 1);
	draw_text_color(640/2, 640 - (640/2)+20, "Restarting in " + curtime, c_white, c_white, c_white, c_white, 1);
	
}