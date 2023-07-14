/// @description 

var _inputX = 0;
var _inputY = 0;

if (autoMove) {
	var _inputX  = sign(autoMoveX - x);
	var _inputY = sign(autoMoveY - y);
	//check if player arrived to target
	if (x == autoMoveX && y == autoMoveY) {
		autoMove = false;
		if (intent == PlayerState.SEEDSBAG) {
			
			//wht happens when arrive to bag of seeds
			show_debug_message("ARRIVED AT BAG OF SEEDS")
			intent = PlayerState.NONE;
			holding = PlayerState.SEEDSBAG;
			
			//change player spirte that holding the bag of seeds (check which seed)
			//if (seed = Seeds.CLOVER) {
			//	sprite_index = sPlayer_Move_Seed;
			
			//}
		}
		
		if (intent = PlayerState.SOIL){
		
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO SOIL")
			intent = PlayerState.NONE;
			if (soil.state == SoilState.EMPTY && holding == PlayerState.SEEDSBAG) {
				holding = PlayerState.NONE;
				soil.state = SoilState.PLANTED;
				show_debug_message("SOIL PLANTED")
				
				//create an instance of oPlant check which seed before the creation than oPlayer.seed = noone;
				if (seed == Seeds.CLOVER ) {
					oPlayer.seed = noone;
					instance_create_layer(soil.x,soil.y-3,"PlantInstances",oFlowerPlant); 
				}
			}			

		}
		
		if (intent == PlayerState.CRATES){
			//wht happens when arrive to the soil
			show_debug_message("ARRIVED TO CRATES")
			intent = PlayerState.NONE;
			if (holding == PlayerState.NONE) {
				show_debug_message("HOLDING A CRATE");

				holding = PlayerState.CRATES;
				//change player animation to move holding a crate
				//sprite_index = sPlayer_Move_Crate;
			}
		}
		
		//if (intent == PlayerState.PLANTS){
		//	//wht happens when arrive to the soil
		//	show_debug_message("ARRIVED TO PLANTS");
		//	intent = PlayerState.NONE;
		//	if (holding == PlayerState.CRATES && oFlowerPlant.state == PlantState.READY) {
		//		holding = noone;
		//		//draw crate sprite on the soil in draw
			
		//	}

			
		
		//}
	}
}


// Get movment speed 
moveX= _inputX * moveSpeed;
moveY= _inputY * moveSpeed;

//Boost
moveX += round(boostX);
moveY += round(boostY);

boostX = lerp(boostX, 0, 0.1);
boostY = lerp(boostY, 0, 0.1);


// this was needed for collisions 
//if (moveX ==0 && moveY == 0 && autoMove) autoMove = false;

//Move instance
x += moveX;
y += moveY;

// choose player animation
if (moveX != 0 or moveY != 0 ){
		//Animation: Move 
		if (holding == PlayerState.CRATES){
			sprite_index = sPlayer_Move_Crate;
		} else {
			sprite_index = sPlayer_Move;
		}	

} else {
	//Animation : Idle
	if (holding == PlayerState.CRATES) {
		sprite_index = sPlayer_Idle_Crate;
	} else {
		sprite_index = sPlayer_Idle;

	}
	
}

//Direction
var _signMouse = sign(mouse_x - x);
if (_signMouse != 0 && !autoMove ){
	image_xscale = _signMouse;
}

//Animation speed 
if (moveX != 0 && sign(moveX) != _signMouse) {
	image_speed = -1;
}
else {
	image_speed = 1;
}