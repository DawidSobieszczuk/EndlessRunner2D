function move(_dir) {
	if(global.is_pause) { return; }	
	_dir = sign(_dir);
	
	if(!is_moving) {
		current_path += _dir;
		
		if(current_path < 0) {
			current_path++;
		} else if(current_path >= paths_count) {
			current_path--;
		} else {
			current_path = clamp(current_path, 0, paths_count-1);
			next_x = paths_positions[current_path];
			dir = _dir;
			is_moving = true;
		}
	}
}

paths_positions = [60, 200, 340, 480, 620];
paths_count = 5;
current_path = 2;

is_moving = false;
next_x = 0;
dir = 0;
move_speed = 20;

x = paths_positions[current_path];

// Input
flick_vel_x = 0.0;