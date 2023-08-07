/// @description when the player choose the barn as a target

// obj_player.action = PLAYER_STATE.GOTO_BARN;

var _action = {
	x: device_mouse_x(0),
	y: device_mouse_y(0),
	type: PLAYER_STATE.GOTO_BARN,
	check_mark: instance_create_layer(x,y+20,"check_mark_instances", obj_check_mark)

}
ds_queue_enqueue(obj_player.actions_queue, _action)

