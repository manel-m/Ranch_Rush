/// @description 

draw_self();

//for now just draw bag of seed that moves with the player
if (holdings[0] == PLAYER_HOLDING.SEEDSBAG) {
	plant_draw_seed(seed);
} 


if (holdings[0] != PLAYER_HOLDING.NONE) {
	if (holdings[0] != PLAYER_HOLDING.SEEDSBAG) {
		draw_sprite_ext( spr_light_box, 0, x+10, y+5, 4,2, 0,c_white, 1 );
		
		holdings_draw_crate(holdings[0], x+14, y+10);
		holdings_draw_crate(holdings[1], x+24, y+10);
		holdings_draw_crate(holdings[2], x+34, y+10);
	}
}

