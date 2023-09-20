/// @description 

draw_self();

//for now just draw bag of seed that moves with the player
if (holdings[0] == PLAYER_HOLDING.SEEDSBAG) {
	if (seed == SEEDS.CLOVER ) 	draw_sprite_ext( spr_clover_seed, 0, x, y, 0.7, 0.7, 0,c_white, 1 );
} 


if (holdings[0] != PLAYER_HOLDING.NONE or holdings[1] != PLAYER_HOLDING.NONE or holdings[2] != PLAYER_HOLDING.NONE){
	if (holdings[0] != PLAYER_HOLDING.SEEDSBAG) {
		draw_sprite_ext( spr_light_box, 0, x+10, y+5, 4,2, 0,c_white, 1 );
	
		if (holdings[0] == PLAYER_HOLDING.CRATE)
			draw_sprite_ext( spr_crate, 0, x+14, y+10, 0.5, 0.5, 0,c_white, 1 );
		else if (holdings[0] == PLAYER_HOLDING.PLANTS_CRATE)
			draw_sprite_ext( spr_plant_crate, 0, x+14, y+10, 0.5, 0.5, 0,c_white, 1 );
	
		if (holdings[1] == PLAYER_HOLDING.CRATE)
			draw_sprite_ext( spr_crate, 0, x+24, y+10, 0.5, 0.5, 0,c_white, 1 );
		else if (holdings[1] == PLAYER_HOLDING.PLANTS_CRATE)
			draw_sprite_ext( spr_plant_crate, 0, x+24, y+10, 0.5, 0.5, 0,c_white, 1 );

		if (holdings[2] == PLAYER_HOLDING.CRATE)
			draw_sprite_ext( spr_crate, 0, x+34, y+10, 0.5, 0.5, 0,c_white, 1 );
		else if (holdings[2] == PLAYER_HOLDING.PLANTS_CRATE)
			draw_sprite_ext( spr_plant_crate, 0, x+34, y+10, 0.5, 0.5, 0,c_white, 1 );
	
	}
	
}
