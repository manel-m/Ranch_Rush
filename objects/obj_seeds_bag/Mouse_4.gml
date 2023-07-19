/// @description when player choose seeds bag as a target



if (obj_player.can_move) {
	obj_player.action =  PLAYER_STATE.GOTO_SEEDSBAG;
	obj_player.seed = seed;
	show_debug_message("CLICK ON BAGSEEDS");
} 






