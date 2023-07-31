/// @description Insert description here
// You can write your code in this editor


draw_self();
draw_sprite_ext(spr_flower_plant, 4 , x-15, y-7,1,1, 0, c_white, 1 );
draw_set_font(fnt_goal);
draw_set_color(c_black)
draw_text(x+3 , y-5, obj_controller.flower_goal);
