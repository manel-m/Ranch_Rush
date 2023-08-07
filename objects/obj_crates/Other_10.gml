/// @description when the player choose the crates as a target

//var _x = mouse_x + irandom_range(-5, 5);
//var _y = mouse_y + irandom_range(-5, 5);

//var _action = {
//	x: mouse_x,
//	y: mouse_y,
//	type: PLAYER_STATE.GOTO_CRATES,
//	check_mark: instance_create_layer(_x,_y,"check_mark_instances", obj_check_mark)
//}
var _action = action_create(PLAYER_STATE.GOTO_CRATES);
ds_queue_enqueue(obj_player.actions_queue, _action);

