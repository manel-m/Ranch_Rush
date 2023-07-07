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
			show_debug_message("ARRIVRD AT BAG OF SEEDS")
			intent = PlayerState.NONE;
			holding = PlayerState.SEEDSBAG;
			
			//change player spirte that holding the bag of seeds (check witch seed)
			//if (seed = Seeds.CLOVER) {
			//	sprite_index = sPlayer_Move;
			
			//}
		}
	
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
	sprite_index = sPlayer_Move;
} else {
	//Animation : Idle
	sprite_index = sPlayer_Idle;
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