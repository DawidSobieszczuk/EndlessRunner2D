// Position update

if(is_moving) {
	x += dir * move_speed;
	
	if(dir > 0 && x >= next_x || dir < 0 && x <= next_x) {
		x = next_x;
		is_moving = false;
	}
}

