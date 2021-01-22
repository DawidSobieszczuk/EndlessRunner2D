if(lives < 0) {
	// Game Over
}


// Position update
if(is_moving) {
	x += dir * move_speed;
	
	if(dir > 0 && x >= next_x || dir < 0 && x <= next_x) {
		x = next_x;
		is_moving = false;
	}
} else {
	if(flick_vel_x > 0) {
		move(1);
	} else if(flick_vel_x < 0) {
		move(-1);
	}
	
	flick_vel_x = 0;
}