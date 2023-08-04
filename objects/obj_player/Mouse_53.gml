/// @description 

if (can_move and !global.pause) {
	auto_move = true;
	auto_move_x = device_mouse_x(0);
	auto_move_y = device_mouse_y(0); 
	
	// Find top most object we clicked on
	var _list = ds_list_create();
	var _num = instance_position_list(mouse_x, mouse_y, all, _list, false);
	if _num > 0
	{
		// Find top most instance under mouse click
		var _min_depth = _list[| 0].depth
		var _top_instance = _list[| 0]
	
	    for (var i = 1; i < _num; ++i;)
	    {
			if (_list[| i].depth < _min_depth) 
			{
				_min_depth = _list[| i].depth
				_top_instance = _list[| i]
			}
	    }
	
		// run custom left click event
		with (_top_instance) {
			event_user(0)
		}
	} else {
		// we didn't click on any object
		show_debug_message("GLOBAL LEFT CLICK");
	}

	ds_list_destroy(_list);
}