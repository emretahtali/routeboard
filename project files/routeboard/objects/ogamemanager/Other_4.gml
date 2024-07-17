if (room == r0)
{
	global.bonds_list = ds_grid_create(4,0);
	bond_first = noone;
	
	#region load
	
	if (file_exists(global.file_name))
	{
		var file_ = file_text_open_read(global.file_name);
		var list_ = json_parse(file_text_read_string(file_));
		file_text_readln(file_);
		var grid_0 = json_parse(file_text_read_string(file_));
		file_text_readln(file_);
		var grid_1 = json_parse(file_text_read_string(file_));
		file_text_close(file_);

		var id_map_ = ds_map_create();

		for (var i = 0; i < array_length(list_); i++)
		{
			var inst_ = instance_create_layer(list_[i].x, list_[i].y, "panels", oPanel);
			ds_map_add(id_map_, list_[i].id, inst_);
			inst_.panel_text = list_[i].panel_text;
			inst_.text_first_half = list_[i].panel_text;
		}
		
		for (var i = 0; i < array_length(grid_0); i++)
		{
			ds_grid_resize(global.bonds_list, 4, ds_grid_height(global.bonds_list) + 1);
			global.bonds_list[# 0, i] = id_map_[? grid_0[i]];
			global.bonds_list[# 1, i] = id_map_[? grid_1[i]];
			global.bonds_list[# 2, i] = id_map_[? grid_1[i]].x;
			global.bonds_list[# 3, i] = id_map_[? grid_1[i]].y;
		}
	
		ds_map_destroy(id_map_);
	}
	
	#endregion
}

global.cursor_type = "pointer";
//pointer
//mover
//bonder