
// Resize game surface
surface_resize(application_surface, RES.WIDTH,RES.HEIGHT);

//Resize Window 
var _window_width = RES.WIDTH * RES.SCALE;
var _window_height = RES.HEIGHT * RES.SCALE;

window_set_size(_window_width, _window_height);

// Start game 
room_goto_next(); 