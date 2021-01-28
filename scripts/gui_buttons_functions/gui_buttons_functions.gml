global.gui_buttons = ds_list_create();
function gui_button_create(_sprite, _x, _y, _function) {
	static _id = -1;
	_id++
	
	var _btn = {
		sprite: _sprite,
		subimg: 0,
		x: _x,
		y: _y,
		action: _function
	};
	
	ds_list_add(global.gui_buttons, _btn);
	
	return _id;
}

function gui_button_is_tapped(_id) {
	var _btn = global.gui_buttons[| _id];
	
	return point_in_rectangle(
		gui_tap_x, gui_tap_y, 
		_btn.x, _btn.y, 
		_btn.x + sprite_get_width(_btn.sprite), _btn.y + sprite_get_height(_btn.sprite)
	);
}

function gui_button_step(_id) {
	var _btn = global.gui_buttons[| _id];
	
	var _speed = sprite_get_speed(_btn.sprite);
	if(sprite_get_speed_type(_btn.sprite) == spritespeed_framespersecond) {
		_speed = _speed / room_speed;
	}
		
	_btn.subimg = (_btn.subimg + _speed)  % sprite_get_number(_btn.sprite);
	
	if(gui_button_is_tapped(_id)) {
		_btn.action();
	}
}

function gui_buttons_step(_ids) {
	var arr_size = array_length(_ids);
	for(var _i = 0; _i < arr_size; _i++) {
		gui_button_step(_ids[_i]);
	}
}

function gui_button_draw(_id) {
	var _btn = global.gui_buttons[| _id];
	
	draw_sprite(_btn.sprite, _btn.subimg, _btn.x, _btn.y);
	
}

function gui_buttons_draw(_ids) {
	var arr_size = array_length(_ids);
	for(var _i = 0; _i < arr_size; _i++) {
		gui_button_draw(_ids[_i]);
	}
}