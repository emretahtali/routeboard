draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fArial);

if (!hold) draw_self();

if (maximized)
{
	#region text
	
	#region prep
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color($181e1d);
	draw_set_alpha(maximized_transition_alpha);
	draw_set_font(fArial3);
	
	#endregion
	
	#region keys
	
	var key_right = keyboard_check(vk_right);
	var key_left = keyboard_check(vk_left);
	var key_up= keyboard_check(vk_up);
	var key_down= keyboard_check(vk_down);
	
	#endregion
	
	var typebar_focused_blink = "";
	
	if (global.focused_item == id)
	{
		text_first_half = keyboard_string;
		panel_text = text_first_half + text_last_half;
	
		#region typebar move
	
		typebar_chars += (keyboard_check_pressed(vk_left) - keyboard_check_pressed(vk_right));
	
		if (key_left - key_right != 0)
		{
			if (typebar_fastmove > 0) typebar_fastmove --;
		}
		else typebar_fastmove = 30;
	
		if (typebar_fastmove == 0)
		{
			if (typebar_slower) typebar_chars += key_left - key_right;
			typebar_slower = !typebar_slower;
		
			typebar_blink = "|";
			typebar_blink_timer = 30;
		}
		else
		{
			#region typebar blink
	
			if (typebar_blink_timer == 0)
			{
				if (typebar_blink == "|") typebar_blink = " ";
				else typebar_blink = "|";
		
				typebar_blink_timer = 30;
			}
			typebar_blink_timer --;
	
		#endregion
		}
	
		typebar_chars = clamp(typebar_chars, 0, string_length(panel_text));
	
		#endregion
		
		typebar_focused_blink = typebar_blink;
	}
	
	text_first_half = string_copy(panel_text, 1, string_length(panel_text) - typebar_chars);
	text_last_half = string_copy(panel_text, string_length(panel_text) - typebar_chars + 1, typebar_chars);
	draw_text_ext_transformed(bbox_left + sprite_width / 18, bbox_top + 3 * (sprite_width / 18), text_first_half + typebar_focused_blink + text_last_half, sprite_width / 18, sprite_width * (16 / 18), 1, 1, 0);
	
	if (global.focused_item == id) keyboard_string = text_first_half;
	
	/*
	var placeholder_text = "";
	repeat (string_length(text_first_half)) placeholder_text += " ";
	draw_text_ext_transformed(bbox_left + sprite_width / 18, bbox_top + 3 * (sprite_width / 18), placeholder_text + "|", sprite_width / 18, sprite_width * (16 / 18), 1, 1, 0);
	*/
	#region finishing touches
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	#endregion
	
	#endregion
	
	#region minimize icon
	
	var minimize_icon_x = bbox_right - sprite_width / 18;
	var minimize_icon_y = bbox_top + sprite_width / 18;
	
	if (global.hovered_item == id) && (point_in_rectangle(mouse_x, mouse_y, bbox_right - .85 * (sprite_width / 9), bbox_top, bbox_right, bbox_top + sprite_width / 9))
	{
		minimize_icon_size = lerp(minimize_icon_size, 1.5, .3);
		if (mouse_check_button_pressed(mb_left)) maximized = false;
	}
	else minimize_icon_size = lerp(minimize_icon_size, 1, .3);
	
	draw_sprite_ext(sSymbols, 0, minimize_icon_x, minimize_icon_y, minimize_icon_size * .5, minimize_icon_size * .5, 0, c_white, 1);
	
	#endregion
	
	#region maximize icon
	
	var maximize_icon_x = bbox_right - 2.5 * (sprite_width / 18);
	var maximize_icon_y = bbox_top + sprite_width / 18;
	
	if (global.hovered_item == id) && (point_in_rectangle(mouse_x, mouse_y, bbox_right - 1.75 * (sprite_width / 9), bbox_top, bbox_right - .85 * (sprite_width / 9), bbox_top + sprite_width / 9))
	{
		maximize_icon_size = lerp(maximize_icon_size, 1.5, .3);
		if (mouse_check_button_pressed(mb_left)) maximized = false;
	}
	else maximize_icon_size = lerp(maximize_icon_size, 1, .3);
	
	draw_sprite_ext(sSymbols, 1, maximize_icon_x, maximize_icon_y, maximize_icon_size * .5, maximize_icon_size * .5, 0, c_white, 1);
	
	#endregion
}
