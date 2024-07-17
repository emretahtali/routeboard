/// @function save_game(end);
/// @param {boolean} end if the game is gonna end

function save_game(end_)
{
	#region file exists
	
	if (global.file_name != "")
	{
		var list_ = array_create(0);
	
		for (var i = 0; i < instance_number(oPanel); i ++)
		{
			var inst_ = instance_find(oPanel, i);
		
			var save_item_ =
			{
				id : inst_.id,
				x : inst_.x,
				y : inst_.y,
				panel_text : inst_.panel_text
			}
		
			array_push(list_, save_item_);
		}

		var grid_0 = array_create(0);
		var grid_1 = array_create(0);
		for (var i = 0; i < ds_grid_height(global.bonds_list); i++)
		{
			grid_0[i] = global.bonds_list[# 0, i];
			grid_1[i] = global.bonds_list[# 1, i];
		}
		
		var file_ = file_text_open_write(global.file_name);
		file_text_write_string(file_, json_stringify(list_));
		file_text_writeln(file_);
		file_text_write_string(file_, json_stringify(grid_0));
		file_text_writeln(file_);
		file_text_write_string(file_, json_stringify(grid_1));
		file_text_close(file_);
		
		ds_grid_destroy(oGui.file_menu_list);
		if (end_) room_goto_previous();
		
	}
	
	#endregion
	
	else
	{
		oGui.file_window = true;
		ds_stack_push(global.escape_queue, escape_from.save_window);
		
		oGui.file_window_game_end = end_;
		keyboard_string = "";
	}
}