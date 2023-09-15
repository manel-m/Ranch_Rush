/// @description depth logic

var _instances_layer_id = layer_get_id("Instances");

with (all) {
	// only change the depth for instances in the "Instances" layer, or
	// instances in the "managed" layer (which are all instances that we already changed the depth for)
	if (layer == _instances_layer_id or layer == -1)
		depth = -bbox_bottom;
}




