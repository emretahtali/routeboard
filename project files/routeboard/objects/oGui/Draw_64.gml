#region preperation

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fArial);
draw_set_alpha(1);

if !surface_exists(gui_surf) gui_surf = surface_create(display_get_gui_width(), display_get_gui_height());

surface_set_target(gui_surf);
draw_clear_alpha(c_black, 0);

#endregion

#region project room

if (room == r0)
{
	#region user interface

	#region toolbar
	
	#region toolbar item positions

	draw_set_color($d331e7);

	var place_width_ = gui_width / 3 / 4;

	toolbar[# 0, 0] = gui_width / 3;
	toolbar[# 1, 0] = gui_width / 25;
	toolbar[# 2, 0] = gui_width / 3 + place_width_ - 1;
	toolbar[# 3, 0] = gui_height / 5;

	toolbar[# 0, 1] = gui_width / 3 + place_width_ + 1;
	toolbar[# 1, 1] = gui_width / 25;
	toolbar[# 2, 1] = gui_width / 3 + place_width_ * 2 - 1;
	toolbar[# 3, 1] = gui_height / 5;

	toolbar[# 0, 2] = gui_width / 3 + place_width_ * 2 + 1;
	toolbar[# 1, 2] = gui_width / 25;
	toolbar[# 2, 2] = gui_width / 3 + place_width_ * 3 - 1;
	toolbar[# 3, 2] = gui_height / 5;

	toolbar[# 0, 3] = gui_width / 3 + place_width_ * 3 + 1;
	toolbar[# 1, 3] = gui_width / 25;
	toolbar[# 2, 3] = gui_width / 3 + place_width_ * 4 - 1;
	toolbar[# 3, 3] = gui_height / 5;

	#endregion

	#region toolbar items hovered
	
	if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), toolbar[# 0, 0], toolbar[# 1, 0], toolbar[# 2, 0], toolbar[# 3, 0]))
	{
		toolbar[# 5, 0] = 1.2;
		
		if (mouse_check_button_pressed(mb_left))
		{
			var inst_x = gui_x_to_screen((toolbar[# 0,0] + toolbar[# 2,0]) / 2);
			var inst_y = gui_y_to_screen((toolbar[# 1,0] + toolbar[# 3,0]) / 2);
		
			var inst_ = instance_create_layer(inst_x, inst_y, "panels", oPanel);
			global.holditem = inst_;
		
			inst_.hold = true;
		}
	}
	else toolbar[# 5, 0] = 1;

	if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), toolbar[# 0, 1], toolbar[# 1, 1], toolbar[# 2, 1], toolbar[# 3, 1]))
	{
		toolbar[# 5, 1] = 1.2;
	
		if (mouse_check_button_pressed(mb_left))
		{
				global.cursor_type = "pointer";
		}
	}
	else toolbar[# 5, 1] = 1;

	if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), toolbar[# 0, 2], toolbar[# 1, 2], toolbar[# 2, 2], toolbar[# 3, 2]))
	{
		toolbar[# 5, 2] = 1.2;
	
		if (mouse_check_button_pressed(mb_left))
		{
				global.cursor_type = "mover";
		}
	}
	else toolbar[# 5, 2] = 1;

	if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), toolbar[# 0, 3], toolbar[# 1, 3], toolbar[# 2, 3], toolbar[# 3, 3]))
	{
		toolbar[# 5, 3] = 1.2;
	
		if (mouse_check_button_pressed(mb_left))
		{
				global.cursor_type = "bonder";
		}
	}
	else toolbar[# 5, 3] = 1;
	
	#endregion
	
	#region toolbar background

	draw_set_color($181e1d);
	draw_rectangle(gui_width / 3, 0, gui_width * (2 / 3), gui_height / 5, false);
	
	#endregion
	
	#region toolbar - rendering sprites

	toolbar[# 4, 0] = lerp(toolbar[# 4, 0], toolbar[# 5, 0], .2);
	toolbar[# 4, 1] = lerp(toolbar[# 4, 1], toolbar[# 5, 1], .2);
	toolbar[# 4, 2] = lerp(toolbar[# 4, 2], toolbar[# 5, 2], .2);
	toolbar[# 4, 3] = lerp(toolbar[# 4, 3], toolbar[# 5, 3], .2);

	draw_sprite_ext(sPanel, 0, (toolbar[# 0, 0] + toolbar[# 2, 0]) / 2, (toolbar[# 1, 0] + toolbar[# 3, 0]) / 2, toolbar[# 4, 0], toolbar[# 4, 0], 0, c_white, 1);
	draw_sprite_ext(sBondTool, 0, (toolbar[# 0, 1] + toolbar[# 2, 1]) / 2, (toolbar[# 1, 1] + toolbar[# 3, 1]) / 2, toolbar[# 4, 1] * .75, toolbar[# 4, 1] * .75, 0, c_white, 1);
	draw_sprite_ext(sBondTool, 1, (toolbar[# 0, 2] + toolbar[# 2, 2]) / 2, (toolbar[# 1, 2] + toolbar[# 3, 2]) / 2, toolbar[# 4, 2] * .8, toolbar[# 4, 2] * .8, 0, c_white, 1);
	draw_sprite_ext(sBondTool, 2, (toolbar[# 0, 3] + toolbar[# 2, 3]) / 2, (toolbar[# 1, 3] + toolbar[# 3, 3]) / 2, toolbar[# 4, 3], toolbar[# 4, 3], 0, c_white, 1);

	#endregion

	#region toolbar stroke
	
	draw_set_color($d331e7);

	draw_line_width(gui_width / 3, 0, gui_width / 3, gui_height / 5, gui_width / 170);
	draw_line_width(gui_width * (2 / 3), 0, gui_width * (2 / 3), gui_height / 5, gui_width / 170);
	draw_line_width(gui_width / 3.03, gui_height / 5, gui_width * (2 / 2.987), gui_height / 5, gui_width / 170);
	
	#endregion
	
	#endregion

	#region tool menu

	if (tool_menu) tool_menu_size = lerp(tool_menu_size, 1, .3);
	if (tool_menu) || (tool_menu_size > .01)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_set_font(fArial3);
	
		var list_ = tool_menu_hovered.tool_menu_list;
		var longest_width_ = string_width(list_[|0]);
		for (var i = 0; i < ds_list_size(list_); i ++)
		{
			longest_width_ = max(longest_width_, string_width(list_[|i]));
		}
	
		var space_size_ = 16;
		var list_size_ = ds_list_size(tool_menu_hovered.tool_menu_list);
		var line_height_ = string_height(list_[|0]);
	
		var tool_menu_width = longest_width_ + 2 * space_size_;
		var tool_menu_height = list_size_ * line_height_ + (list_size_ + 1) * space_size_;
	
		var tool_menu_other_x = tool_menu_x + tool_menu_width * tool_menu_size;
		var tool_menu_other_y = tool_menu_y + tool_menu_height * tool_menu_size;

		draw_rectangle(tool_menu_x, tool_menu_y, tool_menu_other_x, tool_menu_other_y, false);

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_black);
	
		for (var i = 0; i < list_size_; i ++)
		{
			draw_text((tool_menu_x + tool_menu_other_x) / 2, tool_menu_y + space_size_ + line_height_  / 2 + i * (space_size_ + line_height_), list_[|i]);
		}
	
	}
	if (!tool_menu) tool_menu_size = lerp(tool_menu_size, 0, .3);

	#endregion
	
	#endregion

	#region holditem
	
	if (global.holditem != -1)
	{
		with (global.holditem)
		{			
			draw_sprite_ext(sPanel, 0, screen_x_to_gui(x), screen_y_to_gui(y), display_gui_scale, display_gui_scale, 0, c_white, 1);
			
			display_gui_scale = lerp(display_gui_scale, (oCamera.zoom_scale) * 1.2, .2);
			
			if ((abs(x - mouse_x) <= 5) && (abs(y - mouse_y) <= 5)) display_locked_to_mouse = true;
			
			if (!display_locked_to_mouse)
			{
				x = lerp(x, mouse_x, display_speed);
				y = lerp(y, mouse_y, display_speed);
				
				display_speed += .01;
			}
			else
			{
				x = mouse_x;
				y = mouse_y;
			}
		}
	}
	
	#endregion

	#region file window

	if (file_window)
	{
		draw_set_alpha(.8);
		draw_set_color(c_black);
		draw_rectangle(0, 0, gui_width, display_get_gui_height(), false);
		draw_set_alpha(1);
	
		var pos_ =
		{
			x1 : gui_width * 2/5,
			y1 : gui_height * 2/5,
			x2 : gui_width * 3/5,
			y2 : gui_height * 3/5,
			text1_y : gui_height * 27/60,
			text2_y : gui_height * 30/60,
			button_x1 : gui_width * 19 / 40,
			button_y1 : gui_height * 32/60,
			button_x2: gui_width * 21 / 40,
			button_y2 : gui_height * 34/60,
			button_text_y : gui_height * 33/60
		}
	
		draw_set_color($d331e7);
		draw_rectangle(pos_.x1 - gui_width / 170, pos_.y1 - gui_width / 170, pos_.x2 + gui_width / 170, pos_.y2 + gui_width / 170, false);
	
		draw_set_color($181e1d);
		draw_rectangle(pos_.x1, pos_.y1, pos_.x2, pos_.y2, false);
	
		draw_set_color($d331e7);
		draw_text_transformed(gui_width / 2, pos_.text1_y, "save file name:", .75, .75, 0);
	
		if (fw_tb_blink_timer > 0) fw_tb_blink_timer --;
		else
		{
			fw_tb_blink_timer = 30;
			if (fw_tb_blink == "|") fw_tb_blink = " ";
			else fw_tb_blink = "|";
		}
	
		keyboard_string = string_letters(keyboard_string);
	
		draw_set_color(c_white);
		draw_text_transformed(gui_width / 2, pos_.text2_y, keyboard_string + fw_tb_blink, .75, .75, 0);
	
		var button_hovered_ = false;
		if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), pos_.button_x1, pos_.button_y1, pos_.button_x2, pos_.button_y2)) button_hovered_ = true;
	
		if (button_hovered_) draw_set_alpha(.8);
		draw_set_color($d331e7);
		draw_rectangle(pos_.button_x1, pos_.button_y1, pos_.button_x2, pos_.button_y2, false);
		draw_set_color(c_white);
		draw_text_transformed(gui_width / 2, pos_.button_text_y, "ok", .7, .7, 0);
		draw_set_alpha(1);
	
		if (keyboard_check_pressed(vk_enter)) || ((button_hovered_) && (mouse_check_button_pressed(mb_left)))
		{
			global.file_name = keyboard_string + ".txt";
			file_window = false;
			save_game(file_window_game_end);
		}
	}

	#endregion
}

#endregion

#region menu

if (room == rMenu)
{
	var space_ = gui_height / 12;
	
	draw_set_font(fArial2);
	draw_set_color(c_white);
	draw_text_transformed(gui_width / 2, gui_height / 3 - 1.5*space_, "projects", .5, .5, 7);
	
	draw_set_font(fArial1);
	
	#region new project button
	
	var width_ = 130;
	var height_ = 60;
	var y_ = gui_height / 3 - space_ / 2;
	
	if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), gui_width * 1/4 - width_, y_ - height_, gui_width * 1/4 + width_, y_ + height_))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			global.file_name = "";
			ds_stack_push(global.escape_queue, escape_from.game);
			room_goto_next();
		}
		mn_button_scale[1] = 1;
	}
	else mn_button_scale[1] = .8;
	mn_button_scale[0] = lerp(mn_button_scale[0], mn_button_scale[1], .3);
	
	draw_sprite_ext(sMenuButton, 0, gui_width * 1/4, y_, mn_button_scale[0], mn_button_scale[0], 7, c_white, 1);
	draw_text_transformed(gui_width * 1/4, y_, "new project", mn_button_scale[0] / 2, mn_button_scale[0] / 2, 7);
	
	#endregion
	
	#region quit button
	
	if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), gui_width * 3/4 - width_, y_ - height_, gui_width * 3/4 + width_, y_ + height_))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			game_end();
		}
		mn_button_scale[3] = 1;
	}
	else mn_button_scale[3] = .8;
	mn_button_scale[2] = lerp(mn_button_scale[2], mn_button_scale[3], .3);
	
	draw_sprite_ext(sMenuButton, 0, gui_width * 3/4, y_, mn_button_scale[2], mn_button_scale[2], 7, c_white, 1);
	draw_text_transformed(gui_width * 3/4, y_, "quit", mn_button_scale[2] / 2, mn_button_scale[2] / 2, 7);
	
	#endregion
	
	draw_set_color($d331e7);
	for (var i = 0; i < ds_grid_height(file_menu_list); i++)
	{
		var y_ = gui_height / 3 + i*space_;
		
		if (point_in_rectangle(mouse_x_gui(), mouse_y_gui(), gui_width / 2 - gui_width / 7, y_ - space_ / 2, gui_width / 2 + gui_width / 7, y_ + space_ / 2))
		{
			if (mouse_check_button_pressed(mb_left))
			{
				ds_stack_push(global.escape_queue, escape_from.game);
				global.file_name = file_menu_list[# 0, i];
				room_goto_next();
			}
			
			file_menu_list[# 2, i] = 1.3;
		}
		else file_menu_list[# 2, i] = 1;
		
		file_menu_list[# 1, i] = lerp(file_menu_list[# 1, i], file_menu_list[# 2, i], .3);
		
		var file_name_short = string_replace(file_menu_list[# 0, i], ".txt", "");
		draw_text_transformed(gui_width / 2, y_, file_name_short, file_menu_list[# 1, i] * .5, file_menu_list[# 1, i] * .5, 7);
	}
}

#endregion

#region cursor

switch (global.cursor_type)
{
	case "pointer": default: draw_sprite_ext(sCursor, 0, mouse_x_gui(), mouse_y_gui(), 2.5, 2.5, 0, c_white, 1); break;
	case "mover": draw_sprite_ext(sBondTool, 1, mouse_x_gui(), mouse_y_gui(), .75, .75, 0, c_white, 1); break;
	case "bonder": draw_sprite_ext(sBondTool, 2, mouse_x_gui(), mouse_y_gui(), 1, 1, 0, c_white, 1); break;
}
	
surface_reset_target();
	
#endregion

#region debug

#endregion

#region bulgeStripes shader

if (!global.debugmode)
{
	shader_set(shBulgeStripes);
	
	var u_winResolution = shader_get_uniform(shBulgeStripes, "u_winResolution");
	shader_set_uniform_f(u_winResolution, window_get_width(), window_get_height());

	var u_resolution = shader_get_uniform(shBulgeStripes, "u_resolution");
	shader_set_uniform_f(u_resolution, display_get_gui_width(), display_get_gui_height());
	
	var u_bulge = shader_get_uniform(shBulgeStripes, "u_bulge");
	shader_set_uniform_f(u_bulge, screen_bulge);
	
	draw_surface_ext(gui_surf, 0, 0, 1, 1, 0, c_white, 1);
	shader_reset();
}
else draw_surface_ext(gui_surf, 0, 0, 1, 1, 0, c_white, 1);

#endregion