function gui_menu_create() {
	gui_continue_text = "Tap to start";
	gui_continue_text_alpha = 1;
	gui_continue_text_fade_out = true;
	
	gui_button_settings = gui_button_create(spr_btn_settings, 64, display_get_gui_height() - 128, function() {  });
	gui_button_leaderbord = gui_button_create(spr_btn_leaderbord, display_get_gui_width() - 128, display_get_gui_height() - 128, function() { });
}

function gui_menu_step() {
	if(global.time > 0) {
		gui_continue_text =" Tap to continue"; // TODO macro
	} else {
		gui_continue_text = "Tap to start"; // TODO macro
	}
	
	if(gui_continue_text_fade_out) {
		gui_continue_text_alpha -= 0.01; // TODO macro
		if(gui_continue_text_alpha <= 0) gui_continue_text_fade_out = false;
	} else {
		gui_continue_text_alpha += 0.01; // TODO macro
		if(gui_continue_text_alpha >= 1) gui_continue_text_fade_out = true;
	}
	
	
	if(gui_tap_x >= 0 && !gui_button_is_tapped(gui_button_settings) && !gui_button_is_tapped(gui_button_leaderbord)) {
		global.is_pause = false;
	}	
	
	gui_buttons_step([gui_button_settings, gui_button_leaderbord]);	
}

function gui_menu_draw() {	
	// GUI Buttons
	draw_set_color(c_white);
	
	gui_buttons_draw([gui_button_settings, gui_button_leaderbord]);
}

function gui_menu_draw_text() {
	// GUI Text
	draw_set_color(c_white);
	draw_set_font(gui_font);
	draw_set_halign(fa_center);
	draw_set_alpha(gui_continue_text_alpha);
		
	draw_text(400, display_get_gui_height()*0.5, gui_continue_text);	
	
	draw_set_alpha(1);
}