/// @description 

draw_self();

//for now just draw bag of seed that moves with the player

if (holding == PlayerState.SEEDSBAG) {
	if (seed == Seeds.CLOVER ) 	draw_sprite_ext( sCloverSeed, 0, x, y, 0.7, 0.7, 0,c_white, 1 );
} 
//else if (holding == PlayerState.CRATES) {
//		draw_sprite_ext( sCrate_Move, image_index, x, y, 1, 1, 0, c_white, 1 );
//}

//if (holding == noone && oFlowerPlant.state == PlantState.READY ) {
//	draw_sprite_ext( sCrate, 0, x+5, y+8, 0.7, 0.7, 0,c_white, 1 );
//}
