/// @description 

var _input_x = 0;
var _input_y = 0;

if (auto_move) {
	 _input_x  = sign(auto_move_x - x);
	 _input_y = sign(auto_move_y - y);
	//check if player arrived to target
	if (x == auto_move_x && y == auto_move_y) {
		auto_move = false;
		//instance_create_layer(0,0, "GUI_Instances", obj_success_box);

		
		if (action == PLAYER_STATE.GOTO_SEEDSBAG) {
			
			//wht happens when arrive to bag of seeds
			show_debug_message("ARRIVED AT BAG OF SEEDS")
			action = PLAYER_STATE.NONE;
			holding = PLAYER_HOLDING.SEEDSBAG;
			
			//change player spirte that holding the bag of seeds (check which seed)
			//change it player animation
		
		}
		
		if (action == PLAYER_STATE.GOTO_SOIL){
		
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO SOIL")
			action = PLAYER_STATE.NONE;
			if (soil.state == SOIL_STATE.EMPTY && holding == PLAYER_HOLDING.SEEDSBAG) {
				holding = PLAYER_HOLDING.NONE;
				soil.state = SOIL_STATE.PLANTED;
				show_debug_message("SOIL PLANTED")
				
				//create an instance of oPlant check which seed before the creation than oPlayer.seed = noone;
				if (seed == SEEDS.CLOVER ) {
					obj_player.seed = noone;
					instance_create_layer(soil.x,soil.y-3,"PlantInstances",obj_flower_plant); 
				}
			}			

		}
		
		if (action == PLAYER_STATE.GOTO_CRATES){
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO GOTO_CRATES")
			action = PLAYER_STATE.NONE;
			if (holding == PLAYER_HOLDING.NONE) {
				show_debug_message("HOLDING A CRATE");

				holding = PLAYER_HOLDING.CRATE;
				//change player animation to move holding a crate 
				//did it in change player animation down
				
			}
		}
		
		if (action == PLAYER_STATE.GOTO_PLANTS){
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO PLANTS");
			action = PLAYER_STATE.NONE;
			if (holding == PLAYER_HOLDING.CRATE && plant.state == PLANT_STATE.READY) {
				holding = PLAYER_HOLDING.NONE;
				action = PLAYER_STATE.HARVEST;
				can_move = false
				//draw crate sprite on the soil in draw
				//change player animation to palyer harvet
			}
		}
		
		if (action == PLAYER_STATE.GOTO_BARN) {
			//wht happens when arrive to the barn
			show_debug_message("ARRIVED TO THE BARN");
			action = PLAYER_STATE.NONE;
			if (holding == PLAYER_HOLDING.PLANTS_CRATE){
				if (obj_controller.flower_goal>0) {
					obj_controller.flower_goal--;
				}	
			}
			
			holding = PLAYER_HOLDING.NONE;

		}
	}
}


// Get movment speed 
move_x= _input_x * move_speed;
move_y= _input_y * move_speed;

//Boost
move_x += round(boost_x);
move_y += round(boost_y);

boost_x = lerp(boost_x, 0, 0.1);
boost_y = lerp(boost_y, 0, 0.1);


// this was needed for collisions 
//if (move_x ==0 && move_y == 0 && autoMove) autoMove = false;

//Move instance
x += move_x;
y += move_y;

// choose player animation
if (move_x != 0 or move_y != 0 ){
		//Animation: Move 
		if (holding == PLAYER_HOLDING.CRATE){
			sprite_index = spr_player_move_crate;
		} else if (holding == PLAYER_HOLDING.PLANTS_CRATE){
			sprite_index = spr_player_move_plant_crate;
		
		
		} else {
			sprite_index = spr_player_move;
		}	

} else {
	//Animation : Idle
	if (holding == PLAYER_HOLDING.CRATE) {
		sprite_index = spr_player_idle_crate;
	} else if (action == PLAYER_STATE.HARVEST) {
		sprite_index = spr_player_harvest;
		if (start_harvest) 	{
			// we just started harvest animation
			image_index = 0; // restart animation to 0
			start_harvest = false;
		}

		if (image_index >= image_number - 1) {
			// we just finished harvest animation
			action = PLAYER_STATE.NONE;
			holding = PLAYER_HOLDING.PLANTS_CRATE
			start_harvest = true;
			can_move = true;
			
			//reset the state of the harvested plant
			//plant.image_index = 0;
			//plant.alarm[0]= plant.grow_speed;
			with plant {
				event_user(0);
			
			}
			
		}
	} else if (holding == PLAYER_HOLDING.PLANTS_CRATE) {
		sprite_index = spr_player_idle_plant_crate;
	
	}else{
		
		sprite_index = spr_player_idle;
	}
}

//Direction
var _sign_mouse = sign(mouse_x - x);
if (_sign_mouse != 0 && !auto_move ){
	image_xscale = _sign_mouse;
}

//Animation speed 
if (move_x != 0 && sign(move_x) != _sign_mouse) {
	image_speed = -1;
}
else {
	image_speed = 1;
}