function gui_create() {	
	gui_font = font_gui_base;
	gui_font_size = 42;
	gui_tap_x = -1;
	gui_tap_y = -1;	
	
	gui_surface = surface_create(display_get_gui_width(), display_get_gui_height());	
	
	gui_uniform_texel = shader_get_uniform(sh_text, "u_vTexel");
	gui_uniform_color = shader_get_uniform(sh_text, "u_vColor");
	gui_uniform_alpha = shader_get_uniform(sh_text, "u_vAlpha");
	gui_uniform_size = shader_get_uniform(sh_text, "u_vSize");
	
	gui_text_border_color = {
		r: 0.0,
		g: 0.0,
		b: 0.0
	}
	gui_text_border_size = 1;
	gui_text_border_alpha = 1;

	gui_menu_create();
	gui_gameplay_create();
}

function gui_global_tap() {
	gui_tap_x = event_data[?"guiposX"];
	gui_tap_y = event_data[?"guiposY"];
}

function gui_step() {	
	if(global.is_pause) {	
		gui_menu_step();
	} else {
		gui_gameplay_step();
	}
	
	gui_tap_x = -1;
	gui_tap_y = -1;
}

function gui_draw_gui() {
	if(global.is_pause) {	
		gui_menu_draw();
		gui_menu_draw_text();
	} else {
		gui_gameplay_draw();
		gui_gameplay_draw_text();
	}
}