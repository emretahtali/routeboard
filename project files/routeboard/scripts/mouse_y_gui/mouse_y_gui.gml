function mouse_y_gui()
{
	return display_get_gui_height() * ((mouse_y - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]));
}