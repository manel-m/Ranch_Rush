
function collision(_x, _y){
	// if we have a collision make sure can_collide is true, otherwise it's not a collision
	// return place_meeting(_x,_y, obj_collision);
	var _inst = instance_place(_x, _y, obj_collision);
	if (_inst != noone and _inst.can_collide) {
		return true;
	}
	return false;
}