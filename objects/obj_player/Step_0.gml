/// @description 


if (!auto_move && !global.pause && action == PLAYER_STATE.NONE) {
	// player is ready to do an action
	if (!ds_queue_empty(actions_queue)) {
		var _action = ds_queue_dequeue(actions_queue);
		action = _action.type;
		auto_move = true;
		var _target_x = _action.x;
		var _target_y = _action.y;
		
		if (x != _target_x and y != _target_y) {
			
			// make sure _target is not inside an occupied cell, because
			// mp_grid_path() won't be able to find a path
			// to solve this we do:
			// . we check if the target cell is occupied (mp_grid_get_cell() returns -1)
			// . if it is, we move slightly down, and try again (while loop)
			while (mp_grid_get_cell(global.grid, _target_x/RES.GRID_SIZE, _target_y/RES.GRID_SIZE) == -1)
				_target_y += RES.GRID_SIZE / 2;
				
			// ask GameMaker to find a path between player current position (x, y) and _target
			if (mp_grid_path(global.grid, path, x, y, _target_x, _target_y, true)) {
				// we found a valid path, start moving along the path
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


//check if player arrived to target
var _arrived_to_target = path_position == 1;


if (auto_move and _arrived_to_target) {
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
			
		//change player spirte that holding the bag of seeds 
		//change it in player animation //draw it in draw events (checking which seed)
	}
		
	if (action == PLAYER_STATE.GOTO_SOIL) {
		
		//wht happens when arrive to the soil
		show_debug_message("ARRIVED TO SOIL")			
			
		action = PLAYER_STATE.NONE;
		if (soil.state == SOIL_STATE.EMPTY && holdings[0] == PLAYER_HOLDING.SEEDSBAG) {
			holdings[0] = PLAYER_HOLDING.NONE;
			soil.state = SOIL_STATE.PLANTED;
			show_debug_message("SOIL PLANTED")
				
			//create an instance of flower plant check which seed before the creation than oPlayer.seed = noone;
			if (seed == SEEDS.CLOVER ) {
				obj_player.seed = noone;
				instance_create_layer(soil.x,soil.y-3,"Instances",obj_flower_plant); 
			}
			
			//create an instance of tomato plant check which seed before the creation than oPlayer.seed = noone;
			if (seed == SEEDS.TOMATO ) {
				obj_player.seed = noone;
				instance_create_layer(soil.x + 2,soil.y-1,"Instances",obj_tomato_plant); 
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
			//the code in change player animation down
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
				//draw crate sprite on the soil in draw event
				//change player animation to palyer harvet
			}
		}			
	}
		
	if (action == PLAYER_STATE.GOTO_BARN) {
		//wht happens when arrive to the barn
		show_debug_message("ARRIVED TO THE BARN");
		action = PLAYER_STATE.NONE;
			
			
		if (holding_is_plant(holdings[0])) {
			//sell all produce
			for (var _i = 0; _i < 3; _i++) {
				switch (holdings[_i]) {
					case PLAYER_HOLDING.FLOWER_CRATE:
						show_debug_message("SELLING a PLANT CRATE");
						if (obj_controller.daily_order.flower_goal>0) {
							obj_controller.daily_order.flower_goal--;
						}
						break;
					case PLAYER_HOLDING.TOMATO_CRATE:
						show_debug_message("SELLING a TOMATO CRATE");
						if (obj_controller.daily_order.tomato_goal>0) {
							obj_controller.daily_order.tomato_goal--;
						}
						break;
				}
				
			}
			// remove all produce
			holdings_remove_all_produce();
				
		}
	}
}



// choose player animation
if (auto_move) {
	sprite_index = spr_player_move;

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
			if (plant.plant_type == PLANT_TYPES.FLOWER)
				holdings_pickup_plant_crate(PLAYER_HOLDING.FLOWER_CRATE);
				
			if (plant.plant_type == PLANT_TYPES.TOMATO)
				holdings_pickup_plant_crate(PLAYER_HOLDING.TOMATO_CRATE);	
			
			//reset the state of the harvested plant (plant grow again)
			with plant {
				event_user(1);
			}	
		}
	} 
	else {
		sprite_index = spr_player_idle;
	}
}

//Direction
var _sign_mouse = sign(mouse_x - x);
if (_sign_mouse != 0 && !auto_move ){
	image_xscale = _sign_mouse;
}
