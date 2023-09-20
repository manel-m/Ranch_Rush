

//Resolution
enum RES {
	WIDTH = 350,
	HEIGHT = 270,
	SCALE = 3,
	GRID_SIZE = 16
}

// Create camera that follows the player
//var _camera = camera_create_view(0,0,RES.WIDTH,RES.HEIGHT, 0, obj_player, -1,-1,RES.WIDTH/2, RES.HEIGHT/2);


// Create camera 
var _camera = camera_create_view(18,25,RES.WIDTH,RES.HEIGHT, 0)
//Set up view
view_enabled = true;
view_visible[0] = true;

view_set_camera(0,_camera);



//daily goals 
flower_goal = 2;
daily_coins = 200;
coins = 2000;

//pause the game 
global.pause = false;

// path finding grid
global.debug_grid = false;
global.grid = mp_grid_create(0, 0, room_width / RES.GRID_SIZE, room_height / RES.GRID_SIZE, RES.GRID_SIZE, RES.GRID_SIZE);