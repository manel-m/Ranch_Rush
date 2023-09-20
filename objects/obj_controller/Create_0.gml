

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

// starting coins that you have
coins = 2000;
//weekly_orders ... array that contains 7 daily_order
weekly_orders = [
	{ 
		payment: 200,
		flower_goal : 1,
		tomato_goal: 0
	},
	
	{ 
		payment: 400,
		flower_goal : 2,
		tomato_goal: 0
	},
	
	{ 
		payment: 700,
		flower_goal : 3,
		tomato_goal: 0
	},
	
	{ 
		payment: 700,
		flower_goal : 4,
		tomato_goal: 0
	}
];
//set daily_order  from day 0 of weekly_orders
daily_order = weekly_orders[0]; 
// add attribute day to track current day of the week, it starts at 0
day = 0;


//pause the game 
global.pause = false;

// path finding grid
global.debug_grid = false;
global.grid = mp_grid_create(0, 0, room_width / RES.GRID_SIZE, room_height / RES.GRID_SIZE, RES.GRID_SIZE, RES.GRID_SIZE);