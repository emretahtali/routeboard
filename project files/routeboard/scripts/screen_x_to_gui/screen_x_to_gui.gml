/// @function screen_x_to_gui(coord);
/// @param {real} coord the coordinate to be converted

function screen_x_to_gui(coord)
{
	return display_get_gui_width() * ((coord - camera_get_view_x(view_camera[0])) / camera_get_view_width(view_camera[0]));
}