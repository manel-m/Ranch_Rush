/// @description draw path grid

if global.debug_grid {
	draw_set_alpha(0.3);
	mp_grid_draw(global.grid);
	draw_set_alpha(1);
}


