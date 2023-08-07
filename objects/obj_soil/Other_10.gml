/// @description handle left mouse click

//obj_player.action = PLAYER_STATE.GOTO_SOIL;
//obj_player.soil = id;
//show_debug_message("CLICK ON SOIL")

var _action = {
	x: device_mouse_x(0),
	y: device_mouse_y(0),
	type: PLAYER_STATE.GOTO_SOIL,
	soil: id,
	check_mark: instance_create_layer(x+10,y+5,"check_mark_instances", obj_check_mark)
}
ds_queue_enqueue(obj_player.actions_queue, _action)