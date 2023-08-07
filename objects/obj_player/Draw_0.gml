/// @description 

draw_self();

//for now just draw bag of seed that moves with the player
if (holding == PLAYER_HOLDING.SEEDSBAG) {
	if (seed == SEEDS.CLOVER ) 	draw_sprite_ext( spr_clover_seed, 0, x, y, 0.7, 0.7, 0,c_white, 1 );
} 
//else if (holding == PLAYER_HOLDING.CRATE) {
//		draw_sprite_ext( sCrate_Move, image_index, x, y, 1, 1, 0, c_white, 1 );
//}

//Draw a crate on the ground while player is harvesting
if (action == PLAYER_STATE.HARVEST) {
	draw_sprite_ext( spr_crate, 0, x+5, y+8, 0.6, 0.6, 0,c_white, 1 );
}
