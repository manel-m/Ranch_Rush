/// @description 
// You can write your code in this editor


//Properties 
moveSpeed = 1;
//Variables 

moveX = 0;
moveY = 0; 

// helps player movement looks more natural with LERP
boostX = 0;
boostY = 0;


//auto Move when player moves to the target
// (autoMoveX, autoMoveY) is the position the player is moving to when autoMove = true
autoMove = false;
autoMoveX = 0;
autoMoveY = 0;

//player is holding items
enum PlayerState {
	NONE,
	SEEDSBAG,
	SOIL,
	CRATES,
	PLANTS
}

holding = PlayerState.NONE;
intent = PlayerState.NONE;
seed = noone;
soil = noone;
plant = noone;