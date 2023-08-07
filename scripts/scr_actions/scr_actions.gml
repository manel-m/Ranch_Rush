// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_create(_type){

	var _x = mouse_x + irandom_range(-2, 2);
	var _y = mouse_y + irandom_range(-2, 2);

	var _action = {
		x: mouse_x,
		y: mouse_y,
		type: _type,
		check_mark: instance_create_layer(_x,_y,"check_mark_instances", obj_check_mark)
	}
	
	return _action;

}