draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);

if (room == r0)
{
	#region bonds in-between

	if (oGameManager.bond_first != noone)
	{
		draw_line_width_color(oGameManager.bond_first.x, oGameManager.bond_first.y, mouse_x, mouse_y, 5, c_white, c_white);
	}

	for (var i = 0; i < ds_grid_height(global.bonds_list); i++)
	{
		var bond_first = global.bonds_list[# 0, i];
		var bond_end = global.bonds_list[# 1, i];
		var bond_end_x = global.bonds_list[# 2, i];
		var bond_end_y = global.bonds_list[# 3, i];
	
		draw_line_width_color(bond_first.x, bond_first.y, bond_end_x, bond_end_y, 5, c_white, c_white);
	
		global.bonds_list[# 2, i] = lerp(global.bonds_list[# 2, i], bond_end.x, .2);
		global.bonds_list[# 3, i] = lerp(global.bonds_list[# 3, i], bond_end.y, .2);
	}

	#endregion
}