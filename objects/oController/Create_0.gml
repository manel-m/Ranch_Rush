

//Resolution
enum RES {
	WIDTH = 260,
	HEIGHT = 260,
	SCALE = 3
}


// Create camera 
var _camera = camera_create_view(18,50,RES.WIDTH,RES.HEIGHT, 0)
//Set up view
view_enabled = true;
view_visible[0] = true;

view_set_camera(0,_camera);