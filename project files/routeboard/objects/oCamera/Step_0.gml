#region zoom
mouse_saved_x = mouse_x;
mouse_saved_y = mouse_y;

if (!global.game_unfocused)
{
	if (mouse_wheel_up()) zoom_target += 15;
	else if (mouse_wheel_down()) zoom_target -= 15;
}

zoom_target = clamp(zoom_target, max(-400, (cam_default_width - room_width) / 10), 100);
zoom = lerp(zoom, zoom_target, .2);
zoom = clamp(zoom, -400, 100);

camera_set_view_size(view_camera[0], cam_default_width - (zoom * 10), cam_default_height * ((cam_default_width - (zoom * 10)) / cam_default_width));

cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

if (abs(zoom - zoom_target) > .5)
{
	cam_left_x = (((device_mouse_x_to_gui(0) / display_get_gui_width()) * cam_width) * -1) + mouse_saved_x;
	cam_top_y = (((device_mouse_y_to_gui(0) / display_get_gui_height()) * cam_height) * -1) + mouse_saved_y;

	x = cam_left_x + cam_width / 2;
	y = cam_top_y + cam_height / 2;
}

zoom_scale = cam_default_width / camera_get_view_width(view_camera[0]);

#endregion

#region drag
if (!global.game_unfocused)
{
	if (mouse_check_button(mb_right))
	{	
		if (mouse_check_button_pressed(mb_right))
		{
			drag_saved_x = device_mouse_x_to_gui(0);
			drag_saved_y = device_mouse_y_to_gui(0);
			drag_cam_saved_x = x;
			drag_cam_saved_y = y;
		}
	
		x = drag_cam_saved_x - (cam_width * ((device_mouse_x_to_gui(0) - drag_saved_x) / display_get_gui_width()));
		y = drag_cam_saved_y - (cam_height * ((device_mouse_y_to_gui(0) - drag_saved_y) / display_get_gui_height()));
	}
}

#region slide
timer ++;

if (mouse_check_button(mb_right))
{
	speed_x = x - pre_x;
	speed_y = y - pre_y;
	
	pre_x = x;
	pre_y = y;
}

else
{	
	speed_x = lerp(speed_x, 0, .1);
	speed_y = lerp(speed_y, 0, .1);
	
	x += speed_x;
	y += speed_y;
}
#endregion

x = clamp(x, cam_width / 2, room_width - cam_width / 2);
y = clamp(y, cam_height / 2, room_height - cam_height / 2);

if ((x != drag_cam_saved_x - (device_mouse_x_to_gui(0) - drag_saved_x)) || y != drag_cam_saved_y - (device_mouse_y_to_gui(0) - drag_saved_y))
{
	drag_saved_x = device_mouse_x_to_gui(0);
	drag_saved_y = device_mouse_y_to_gui(0);
	drag_cam_saved_x = x;
	drag_cam_saved_y = y;
}

#endregion

camera_set_view_pos(view_camera[0], x - cam_width / 2, y - cam_height / 2);