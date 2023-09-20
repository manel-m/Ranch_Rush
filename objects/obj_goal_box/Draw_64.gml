/// @description Insert description here
// You can write your code in this editor


draw_self();
draw_sprite_ext(spr_flower_plant, 4 , x, y+2,1,1, 0, c_white, 1 );
draw_set_font(fnt_goal);
draw_set_color(c_black)
draw_text(x+20 , y+2, obj_controller.daily_order.flower_goal);
