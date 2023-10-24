//function plant_X(_Y) {
//	switch (_Y) {
//		case SEEDS.CLOVER:

//			break;		
//		case SEEDS.TOMATO:

//			break;
//	}
//}


function plant_create_instance(_seed) {
	switch (_seed) {
		case SEEDS.CLOVER:
			instance_create_layer(soil.x,soil.y-3,"Instances",obj_flower_plant); 
			break;	
			
		case SEEDS.TOMATO:
			instance_create_layer(soil.x + 2,soil.y-1,"Instances",obj_tomato_plant); 
			break;
	}
}

function plant_draw_seed(_seed) {
	switch (_seed) {
		case SEEDS.CLOVER:
			draw_sprite_ext( spr_clover_seed, 0, x, y, 0.7, 0.7, 0,c_white, 1 );
			break;	
			
		case SEEDS.TOMATO:
			draw_sprite_ext( spr_tomato_seed, 0, x, y, 0.7, 0.7, 0,c_white, 1 );
			break;
	}
}

function plant_in_crate(_plant_type) {
	switch (_plant_type) {
		case SEEDS.CLOVER:
			holdings_pickup_plant_crate(PLAYER_HOLDING.FLOWER_CRATE);
			break;	
			
		case SEEDS.TOMATO:
			holdings_pickup_plant_crate(PLAYER_HOLDING.TOMATO_CRATE);	
			break;
	}
}