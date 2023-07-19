/// @description when the player choose the soil as a target


if (obj_player.can_move) {
	obj_player.action = PLAYER_STATE.GOTO_SOIL;
	obj_player.soil = id;
}





