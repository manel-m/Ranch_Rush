/// @description Insert description here
// You can write your code in this editor

var _sprite = noone;
var _goal = noone;
var _sprite_x = x;
var _sprite_y = y+2;
var _sprite_scale = 1;

if plant_type == PLANT_TYPES.FLOWER {
	_sprite = spr_flower_plant;
	_goal = obj_controller.daily_order.flower_goal;
	
} else {
	_sprite = spr_tomato_plant;
	_goal = obj_controller.daily_order.tomato_goal;
	_sprite_x = x+ 3;
	_sprite_y = y+ 3 ;
	_sprite_scale = 0.8;
}
 
 if (!_goal == 0) {
draw_self();
draw_sprite_ext(_sprite, 4 , _sprite_x, _sprite_y,_sprite_scale,_sprite_scale, 0, c_white, 1 );
draw_set_font(fnt_goal);
draw_set_color(c_black);
draw_text(x+20 , y+2, _goal);
 }
