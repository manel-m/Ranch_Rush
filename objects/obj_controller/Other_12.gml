/// @description next day


global.pause = false;
obj_player.can_move = true;

//increment day
day = day+ 1;
//set daily_order from weekly_orders[day]
daily_order= weekly_orders[day];

//to change when we put the other goals
//daily_order.flower_goal = 3;
//daily_order.payment = 400;

