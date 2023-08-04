/// @description Init

image_xscale = 18;
image_yscale = 18;

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);

x = _vx + (RES.WIDTH - sprite_width) / 2;
y = _vy + (RES.HEIGHT - sprite_height) / 2;

