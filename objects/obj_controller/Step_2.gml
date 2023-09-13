/// @description depth logic

var _instances_layer_id = layer_get_id("Instances");

with (all) {
	if (layer == _instances_layer_id)
		depth = -bbox_bottom;
}




