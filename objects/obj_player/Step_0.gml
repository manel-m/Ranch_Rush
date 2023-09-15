/// @description 

/*
var _input_x = 0;
var _input_y = 0;
*/

if (!auto_move && !global.pause && action == PLAYER_STATE.NONE) {
	// player is ready to do an action
	if (!ds_queue_empty(actions_queue)) {
		var _action = ds_queue_dequeue(actions_queue);
		action = _action.type;
		auto_move = true;
		var _target_x = _action.x;
		var _target_y = _action.y;
		
		if (x != _target_x and y != _target_y) {
			while (mp_grid_get_cell(global.grid, _target_x/RES.GRID_SIZE, _target_y/RES.GRID_SIZE) == -1)
				_target_y += RES.GRID_SIZE / 2;
				
			if (mp_grid_path(global.grid, path, x, y, _target_x, _target_y, true)) {
				path_start(path, move_speed, path_action_stop, true);
			}
		}
		
		if (struct_exists(_action, "check_mark")) {
			check_mark = _action.check_mark;
		}
		
		if (action == PLAYER_STATE.NONE) {
			show_debug_message("ACTION: global click")
		} else if (action == PLAYER_STATE.GOTO_SEEDSBAG) {
			show_debug_message("ACTION: goto seed bag")
			seed = _action.seed			
		} else if (action == PLAYER_STATE.GOTO_SOIL) {
			show_debug_message("ACTION: goto soil")
			soil = _action.soil
		} else if (action == PLAYER_STATE.GOTO_CRATES) {
			show_debug_message("ACTION: goto crates")
		} else if (action == PLAYER_STATE.GOTO_PLANTS) {
			show_debug_message("ACTION: goto plant")
			plant = _action.plant
		} else if (action == PLAYER_STATE.GOTO_BARN) {
			show_debug_message("ACTION: goto barn")
		}
	}
}

if (auto_move) {
/*
	 _input_x  = sign(auto_move_x - x);
	 _input_y = sign(auto_move_y - y);
*/	

	//check if player arrived to target
	//var _arrived_to_target = x == auto_move_x && y == auto_move_y;
	var _arrived_to_target = path_position == 1;
	// var _cannot_move = collision_xy;
	
	// collision_xy = false; // reset attribute

	if (_arrived_to_target /*or _cannot_move*/) {
		auto_move = false;
		
		// player is going to execute its current action	
		instance_destroy(check_mark);
		check_mark = noone;
		
		if (action == PLAYER_STATE.GOTO_SEEDSBAG) {

			//wht happens when arrive to bag of seeds
			show_debug_message("ARRIVED AT BAG OF SEEDS")
			action = PLAYER_STATE.NONE;

			if (!holdings_has_produce()) {
				// remove all holdings
				holdings_remove_all();

				// hold a seed bag
				holdings[0] = PLAYER_HOLDING.SEEDSBAG;
			}
			
			//change player spirte that holding the bag of seeds (check which seed)
			//change it in player animation
		}
		
		if (action == PLAYER_STATE.GOTO_SOIL) {
		
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO SOIL")			
			
			action = PLAYER_STATE.NONE;
			if (soil.state == SOIL_STATE.EMPTY && holdings[0] == PLAYER_HOLDING.SEEDSBAG) {
				holdings[0] = PLAYER_HOLDING.NONE;
				soil.state = SOIL_STATE.PLANTED;
				show_debug_message("SOIL PLANTED")
				
				//create an instance of oPlant check which seed before the creation than oPlayer.seed = noone;
				if (seed == SEEDS.CLOVER ) {
					obj_player.seed = noone;
					instance_create_layer(soil.x,soil.y-3,"Instances",obj_flower_plant); 
				}
			}			
		}
		
		if (action == PLAYER_STATE.GOTO_CRATES){
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO GOTO_CRATES")
			action = PLAYER_STATE.NONE;
			
			if (holdings_pickup_crate()) {
				show_debug_message("HOLDING A CRATE");

				//change player animation to move holding a crate 
				//did it in change player animation down
			}
		}
		
		if (action == PLAYER_STATE.GOTO_PLANTS) {
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO PLANTS");
			action = PLAYER_STATE.NONE;
			
			if (plant.state == PLANT_STATE.READY) {
				//// is the player holding at least one empty crate
				if (holdings_has_empty_crate()) {
					// holding = PLAYER_HOLDING.NONE;
					action = PLAYER_STATE.HARVEST;
					can_move = false
					//draw crate sprite on the soil in draw
					//change player animation to palyer harvet
				}
			}
			
		}
		
		if (action == PLAYER_STATE.GOTO_BARN) {
			//wht happens when arrive to the barn
			show_debug_message("ARRIVED TO THE BARN");
			action = PLAYER_STATE.NONE;
			
			
			if (holdings[0] == PLAYER_HOLDING.PLANTS_CRATE) {
				//sell all produce
				for (var _i = 0; _i < 3; _i++) {
					if (holdings[_i] == PLAYER_HOLDING.PLANTS_CRATE){
						show_debug_message("SELLING a PLANT CRATE");
						if (obj_controller.flower_goal>0) {
							obj_controller.flower_goal--;
						}
					}
				
				}
				// remove all produce
				holdings_remove_all_produce();
				
			}
		}
	}
}

/*
// Get movment speed 
move_x= _input_x * move_speed;
move_y= _input_y * move_speed;

//Boost
move_x += round(boost_x);
move_y += round(boost_y);

boost_x = lerp(boost_x, 0, 0.1);
boost_y = lerp(boost_y, 0, 0.1);

//collisions
if(collision(x + move_x,y)){
	while (!collision(x + sign(move_x),y)){
		x += sign(move_x);
	}
	move_x = 0;
	show_debug_message("PLAYER COLLISION")
}

if (collision(x, y + move_y)){
	while (!collision(x ,y + sign(move_y))){
		y += sign(move_y);
	}
	move_y = 0;
	show_debug_message("PLAYER COLLISION")
}

if (auto_move and move_x == 0 and move_y == 0) {
	collision_xy = true;
	show_debug_message("FULL COLLISION")
}

//Move instance
x += move_x;
y += move_y;
*/

// choose player animation
if (auto_move) {
		//Animation: Move 
		//if (holdings[0] == PLAYER_HOLDING.CRATE){
		//	sprite_index = spr_player_move_crate;
		//} else if (holdings[0] == PLAYER_HOLDING.PLANTS_CRATE){
		//	sprite_index = spr_player_move_plant_crate;
		//} else {
			sprite_index = spr_player_move;
		//}	

} else {
	//Animation : Idle
	if (action == PLAYER_STATE.HARVEST) {
		sprite_index = spr_player_harvest;
		if (start_harvest) 	{
			// we just started harvest animation
			image_index = 0; // restart animation to 0
			start_harvest = false;
		}
		if (image_index >= image_number - 1) {
			// we just finished harvest animation
			action = PLAYER_STATE.NONE;
			//holding = PLAYER_HOLDING.PLANTS_CRATE
			start_harvest = true;
			can_move = true;
			
			//replace an empty crate with a plants crate to the holdings
			holdings_pickup_plant_crate()
			
			//reset the state of the harvested plant (plant grow again)
			with plant {
				event_user(1);
			}	
		}
	} 
	//else if (holdings[0] == PLAYER_HOLDING.PLANTS_CRATE) {
	//	sprite_index = spr_player_idle_plant_crate;
	//} else if (holdings[0] == PLAYER_HOLDING.CRATE) {
	//	sprite_index = spr_player_idle_crate;
	//}
	else {
		sprite_index = spr_player_idle;
	}
}

//Direction
var _sign_mouse = sign(mouse_x - x);
if (_sign_mouse != 0 && !auto_move ){
	image_xscale = _sign_mouse;
}

//Animation speed 
//if (move_x != 0 && sign(move_x) != _sign_mouse) {
//	image_speed = -1;
//}
//else {
//	image_speed = 1;
//}