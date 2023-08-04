/// @description when player choose seeds bag as a target

//obj_player.action =  PLAYER_STATE.GOTO_SEEDSBAG;
//obj_player.seed = seed;
//show_debug_message("CLICK ON BAGSEEDS");
 
var _action = {
	x: device_mouse_x(0),
	y: device_mouse_y(0),
	type: PLAYER_STATE.GOTO_SEEDSBAG,
	seed: seed
}
ds_queue_enqueue(obj_player.actions_queue, _action)






