/// @description 

draw_self();

//for now just draw bag of seed that moves with the player

if (holding == PlayerState.SEEDSBAG) {
	if (seed == Seeds.CLOVER ) 	draw_sprite_ext( sCloverSeed, 0, x, y, 0.7, 0.7, 0,c_white, 1 );
	//draw_sprite(sCloverSeed, 0,x,y);
}