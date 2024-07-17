display_set_gui_size(gui_width, gui_height);

if (room == rMenu)
{
	#region file menu

	file_menu_list = ds_grid_create(3, 0);
	
	var file_name_ = file_find_first("*.txt", 0);
	while (file_name_ != "")
	{
		var height_ = ds_grid_height(file_menu_list);
		ds_grid_resize(file_menu_list, 3, height_ + 1);
		file_menu_list[# 0, height_] = file_name_;
		file_menu_list[# 1, height_] = 1;
		file_menu_list[# 2, height_] = 1;
	
		file_name_ = file_find_next();
	}
	
	if (ds_grid_height(file_menu_list) == 0)
	{
		ds_stack_push(global.escape_queue, escape_from.game);
		room_goto_next();
	}
	
	mn_button_scale = array_create(0);
	array_push(mn_button_scale, .8);
	array_push(mn_button_scale, .8);
	array_push(mn_button_scale, .8);
	array_push(mn_button_scale, .8);
	
	#endregion
}