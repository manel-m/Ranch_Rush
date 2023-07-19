/// @description when the player choose plant as a target

if (obj_player.can_move) {
	obj_player.action = PLAYER_STATE.GOTO_PLANTS;
	obj_player.plant = id;

}