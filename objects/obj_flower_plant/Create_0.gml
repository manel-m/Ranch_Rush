/// @description 

event_inherited();

enum PLANT_STATE {
	GROWING,
	READY
}

state = noone;


// to grow up plants
image_index = 0;
grow_speed = game_get_speed(gamespeed_fps) * 0.5;
alarm[0] = grow_speed ;

