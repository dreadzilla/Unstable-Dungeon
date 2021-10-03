/// @description Draw Gui based on room

if (room == rTitle) {
	draw_set_halign(fa_center);
	draw_set_font(fTitle);
	draw_text_color(room_width/2 + 1, (room_height/4) + 1, "Unstable Dungeon", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width/2, (room_height/4), "Unstable Dungeon", c_white, c_white, c_white, c_white, 1);
	
	draw_set_font(fStart);
	draw_text_color(room_width/2 + 1, room_height - (room_height/2) + 1, "Arrow keys to steer and M toggles map.", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width/2, room_height - (room_height/2), "Arrow keys to steer and M toggles map.", c_white, c_white, c_white, c_white, 1);
	
	draw_set_font(fStart);
	draw_text_color(room_width/2 + 1, room_height - (room_height/2.5) + 1, "Find the key and exit until your life runs out. How many levels can you pass?", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width/2, room_height - (room_height/2.5), "Find the key and exit until your life runs out. How many levels can you pass?", c_white, c_white, c_white, c_white, 1);
		
	draw_set_font(fStart);
	draw_text_color(room_width/2 + 1, room_height - (room_height/4) + 1, "Press space to play", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width/2, room_height - (room_height/4), "Press space to play", c_white, c_white, c_white, c_white, 1);

}

