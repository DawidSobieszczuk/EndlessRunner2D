if(global.is_pause) exit;

y += global.game_speed;

if(y < 0) {
	instance_destroy();
}
