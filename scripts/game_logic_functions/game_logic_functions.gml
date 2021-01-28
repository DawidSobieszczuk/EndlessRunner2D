// Manager functions
function game_create() {
	
}

function game_step() {
	if(global.is_pause) { 
		layer_vspeed("Background", 0);
		return;
	} 	
	
	global.time++;
	layer_vspeed("Background", global.game_speed);
}

// Other functions
function game_start() {
	global.game_speed = 2;
	global.player_lives = PLAYER_START_LIVES;
	global.coin = 0;
	global.time = 0;
}