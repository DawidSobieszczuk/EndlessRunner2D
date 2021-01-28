function gui_gameplay_create() {
	gui_time = 0;
	gui_lives = 0;
	gui_coins = 0;
	
	
	gui_btn_pause = gui_button_create(spr_btn_pause, display_get_gui_width() - 128, display_get_gui_height() - 128, function() { global.is_pause = true; });
}

function gui_gameplay_step() {
	// GUI Text
	gui_time = global.time;
	
	gui_time = string_format(gui_time div room_speed, 3, 0);
	gui_time = "Time: " + string_replace_all(gui_time, " ", "0");
	
	gui_lives = "Lives: " + string(global.player_lives);
	gui_coins = "Coins: " + string(global.coins);
	
	// GUI Buttons
	gui_button_step(gui_btn_pause);
}

function gui_gameplay_draw() {	
	// GUI Buttons
	draw_set_color(c_white);
	gui_button_draw(gui_btn_pause);
}

function gui_gameplay_draw_text() {
	// GUI Text
	draw_set_color(c_white);
	draw_set_font(gui_font);
	draw_set_halign(fa_center);
	
	draw_text(400, display_get_gui_height() - (48+gui_font_size), gui_time);	
	draw_text(400, 24, gui_lives);
	draw_text(400, 48+gui_font_size, gui_coins);
}