if (mouse_check_button_released(mb_left)) && (hold)
{
	hold = false;
	global.holditem = -1;
	
	#region depth
	
	var scale_ = image_xscale;
	image_xscale = maximized_size;
	image_yscale = maximized_size;
	
	var inst_list_ = ds_list_create();
	instance_place_list(x, y, oPanel, inst_list_, false);
	if (ds_list_size(inst_list_) > 0)
	{
		var inst_depth_ = noone;
		for (var i = 0; i < ds_list_size(inst_list_); i ++)
		{
			inst_depth_ = min(inst_depth_, inst_list_[|i].depth);
		}
		depth = inst_depth_ - 1;
	}
	
	ds_list_destroy(inst_list_);
	image_xscale = scale_;
	image_yscale = scale_;
	
	#endregion
}

if (maximized)
{
	image_xscale = lerp(image_xscale, maximized_size, .2);
	image_yscale = lerp(image_yscale, maximized_size, .2);
	
	maximized_transition_alpha = lerp(maximized_transition_alpha, 1, .1);
}
else if (global.hovered_item == id)
{
	image_xscale = lerp(image_xscale, hovered_size, .2);
	image_yscale = lerp(image_yscale, hovered_size, .2);
	
	maximized_transition_alpha = lerp(maximized_transition_alpha, 0, .1);
}
else
{
	image_xscale = lerp(image_xscale, 1, .2);
	image_yscale = lerp(image_yscale, 1, .2);
	
	maximized_transition_alpha = lerp(maximized_transition_alpha, 0, .1);
}

if (global.hovered_item == id)
{
	if (mouse_check_button_pressed(mb_left))
	{
		var scale_ = image_xscale;
		image_xscale = maximized_size;
		image_yscale = maximized_size;
	
		var inst_list_ = ds_list_create();
		instance_place_list(x, y, oPanel, inst_list_, false);
		if (ds_list_size(inst_list_) > 0)
		{
			var inst_depth_ = noone;
			for (var i = 0; i < ds_list_size(inst_list_); i ++)
			{
				inst_depth_ = min(inst_depth_, inst_list_[|i].depth);
			}
			depth = inst_depth_ - 1;
		}
	
		ds_list_destroy(inst_list_);
		image_xscale = scale_;
		image_yscale = scale_;
	}
}