/// @description 
// You can write your code in this editor


//Properties 
move_speed = 1;
//Variables 

move_x = 0;
move_y = 0; 

// helps player movement looks more natural with LERP
boost_x = 0;
boost_y = 0;


//auto Move when player moves to the target
// (automove_x, automove_y) is the position the player is moving to when autoMove = true
auto_move = false;
auto_move_x = 0;
auto_move_y = 0;

can_move = true;

//player is holding items
enum PLAYER_STATE {
	NONE,
	GOTO_SEEDSBAG,
	GOTO_SOIL,
	GOTO_CRATES,
	GOTO_PLANTS,
	HARVEST
}

enum PLAYER_HOLDING {
	NONE,
	SEEDSBAG,
	CRATES,
	PLANTS_CRATE
};

holding = PLAYER_HOLDING.NONE;
action = PLAYER_STATE.NONE;
seed = noone;
soil = noone;
plant = noone;

// to start harvest animation from the first frame
start_harvest = true;