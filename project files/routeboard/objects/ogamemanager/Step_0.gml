#region key binds

if (keyboard_check(vk_control))
{
	if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	if (keyboard_check_pressed(ord("G"))) game_restart();
	if (keyboard_check_pressed(ord("R"))) room_restart();
	//if (keyboard_check_pressed(ord("P"))) room_speed = 62 - room_speed;
	if (keyboard_check_pressed(ord("D"))) global.debugmode = !global.debugmode;
	if (keyboard_check_pressed(ord("S"))) save_game(false);
}

if (keyboard_check_pressed(vk_escape))
{
	switch (ds_stack_pop(global.escape_queue))
	{
		case noone: default: save_game(true); break;
		case escape_from.menu: game_end(); break;
		case escape_from.game: save_game(true); break;
		case escape_from.save_window: oGui.file_window = false; break;
	}
}

#endregion

#region mouse hover on objects

var inst_list_ = ds_list_create();
instance_position_list(mouse_x, mouse_y, oPanel, inst_list_, false);
if (ds_list_size(inst_list_) > 0)
{
	#region hovered
	
	var inst_ = inst_list_[|0];
	for (var i = 1; i < ds_list_size(inst_list_); i ++)
	{
		if (inst_list_[|i].depth < inst_.depth) inst_ = inst_list_[|i];
	}
	
	if (global.holditem == -1) global.hovered_item = inst_;
	else global.hovered_item = global.holditem;
	
	#endregion
	
	#region clicked
	
	if (mouse_check_button_pressed(mb_left))
	{
		switch (global.cursor_type)
		{
			case "pointer": default:
			{
				global.focused_item = inst_;
				inst_.maximized = true;
				keyboard_string = inst_.text_first_half;
				
				break;
			}
			case "mover": break;
			case "bonder": bond_first = inst_; break;
		}
	}
	
	#endregion
	
	#region bonders monders
	
	if (bond_first != noone)
	{
		if (mouse_check_button_released(mb_left))
		{
			if (inst_ != bond_first)
			{
				var list_width = ds_grid_width(global.bonds_list);
				var list_height = ds_grid_height(global.bonds_list);
				
				ds_grid_resize(global.bonds_list, list_width, list_height + 1);
				global.bonds_list[# 0, list_height] = bond_first;
				global.bonds_list[# 1, list_height] = inst_;
				global.bonds_list[# 2, list_height] = mouse_x;
				global.bonds_list[# 3, list_height] = mouse_y;
			}
			bond_first = noone;
		}
	}
	
	#endregion
}

else 
{
	global.hovered_item = -1;
	
	if (mouse_check_button_released(mb_left)) bond_first = noone;
}

ds_list_destroy(inst_list_);

#endregion

if (mouse_check_button_pressed(mb_right))
{
	alarm[0] = 10;
	right_click_x = mouse_x_gui();
	right_click_y = mouse_y_gui();

	oGui.tool_menu_x = mouse_x_gui();
	oGui.tool_menu_y = mouse_y_gui();
	oGui.tool_menu_hovered = (global.hovered_item == -1)? oGui : global.hovered_item;
}
if (mouse_check_button_pressed(mb_left)) oGui.tool_menu = false;