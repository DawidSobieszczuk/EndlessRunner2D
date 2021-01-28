/// TODO
function android_camera_create(_width){
	if(_width == 0) {
		_width = room_width;
	}
	
	// Object variables
	camera_view_width = _width;
	camera_view_height = _width*1.6;
	
	if(os_type == os_android) {
		camera_view_width = _width;
		camera_view_height = (display_get_height() / display_get_width()) * _width;
	}
	
	display_set_gui_size(camera_view_width, camera_view_height);
}

/// TODO
function android_camera_room_start(){
	view_enabled = true;
	view_visible[0] = true;

	camera_set_view_size(view_camera[0], camera_view_width, camera_view_height);
}