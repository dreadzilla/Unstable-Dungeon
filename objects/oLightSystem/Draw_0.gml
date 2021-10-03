/// @description Insert description here
// You can write your code in this editor

draw_surface_ext(surf,0,0,res,res,0,0,1);

//if (!surface_exists(surf))
//{
//	surf = surface_create(room_width,room_height);	
//	surface_set_target(surf);
//	draw_clear(c_black);
//	surface_reset_target();
//}

surface_set_target(surf);

//draw_clear(c_black);
gpu_set_blendmode(bm_src_color);
//draw_sprite_ext(sBlack,0,0,0,640,640,0,c_white,0.048);
draw_sprite_ext(sLightbulb,0,oPlayer.x/res,oPlayer.y/res,0.5,0.5,0,c_white,lightsize);
gpu_set_blendmode(bm_normal);
surface_reset_target();

//surface_set_target(surf);
//
//surface_reset_target();
