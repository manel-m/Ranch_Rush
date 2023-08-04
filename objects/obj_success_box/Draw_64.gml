/// @description Insert description here
// You can write your code in this editor


draw_self();
draw_set_font(fnt_goal);
draw_set_color(c_white);
draw_text(x+50,y+4, "WELL DONE");
draw_set_color(c_green);
draw_text(x+50,y+5,"WELL DONE");

draw_set_color(c_black);
draw_set_font(fnt_succes)//(fnt_nico_paint);
draw_text(x ,y+20," You've learned how to PLANT  \n             and HARVEST");

draw_set_color(c_maroon);
draw_set_font(fnt_succes)//(fnt_nico_paint);
draw_text(x + 30 ,y+60 ," Payment:  $" + string (obj_controller.daily_coins));
draw_text(x + 32 ,y+73 , "Time bonus:   TBD  ") ;
draw_text(x + 32 ,y+87 , "Total payment:  $ " + string(obj_controller.coins)) ;










