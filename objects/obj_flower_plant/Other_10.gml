/// @description when the player choose plant as a target

//obj_player.action = PLAYER_STATE.GOTO_PLANTS;
//obj_player.plant = id;
//show_debug_message("CLICK ON FLOWER")

var _action = {
	x: device_mouse_x(0),
	y: device_mouse_y(0),
	type: PLAYER_STATE.GOTO_PLANTS,
	plant: id
}
ds_queue_enqueue(obj_player.actions_queue, _action)
