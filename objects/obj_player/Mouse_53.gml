/// @description 

// if (we are showing success GUI)
//   with (obj_controller) {
//	   event_user(1);
//   }
//   destroy success gui




if (can_move and !global.pause) {
	show_debug_message("LEFT CLICK");
	auto_move = true;
	auto_move_x = device_mouse_x(0);
	auto_move_y = device_mouse_y(0); 
}