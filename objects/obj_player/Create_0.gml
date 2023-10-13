/// @description 

//Properties 
move_speed = 1;

//auto Move when player moves to the target
auto_move = false;

can_move = true;
// collision_xy = false;

// player state
enum PLAYER_STATE {
	NONE,
	GOTO_SEEDSBAG,
	GOTO_SOIL,
	GOTO_CRATES,
	GOTO_PLANTS,
	HARVEST,
	GOTO_BARN
}


//player is holding items
enum PLAYER_HOLDING {
	NONE,
	SEEDSBAG,
	CRATE,
	FLOWER_CRATE,
	TOMATO_CRATE
}

//holding = PLAYER_HOLDING.NONE;
holdings = [PLAYER_HOLDING.NONE, PLAYER_HOLDING.NONE, PLAYER_HOLDING.NONE];

action = PLAYER_STATE.NONE;

seed = noone;
soil = noone;
plant = noone;

check_mark = noone;

// to start harvest animation from the first frame
start_harvest = true;

// actions queue
actions_queue = ds_queue_create()

// path finding
path = path_add();