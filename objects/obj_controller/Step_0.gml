/// @description 


if (flower_goal == 0) {
	instance_create_layer(0,0, "GUI_Instances", obj_success_box);
	coins = coins + daily_coins;
	event_user(0);
	//to change when we put the other goals
	flower_goal = 2;
	daily_coins = 400;
}