/// @description 

if (!global.pause) {
	
	// Find top most object we clicked on
	var _list = ds_list_create();
	var _num = instance_position_list(mouse_x, mouse_y, obj_clickable, _list, false);
	if _num > 0 {
		// Find top most instance under mouse click
		var _min_depth = _list[| 0].depth
		var _top_instance = _list[| 0]
	
	    for (var _i = 1; _i < _num; ++_i)
	    {
			if (_list[| _i].depth < _min_depth) 
			{
				_min_depth = _list[| _i].depth
				_top_instance = _list[| _i]
			}
	    }
		
		show_debug_message("found " + string(_num) + " instances")
	
		// run custom left click event
		with (_top_instance) {
			event_user(0)
		}
	} else {
		// we didn't click on any object
		var _action = {
			x: device_mouse_x(0),
			y: device_mouse_y(0),
			type: PLAYER_STATE.NONE
		}
		ds_queue_enqueue(actions_queue, _action)
	}

	ds_list_destroy(_list);
}