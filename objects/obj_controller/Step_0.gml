/// @description 


if (!global.pause and daily_order.flower_goal == 0) {
	instance_create_layer(0,0, "GUI_Instances", obj_success_box);
	coins = coins + daily_order.payment;
	event_user(0);
	
}