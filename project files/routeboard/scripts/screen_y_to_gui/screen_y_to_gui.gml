/// @function screen_y_to_gui(coord);
/// @param {real} coord the coordinate to be converted

function screen_y_to_gui(coord)
{
	return display_get_gui_height() * ((coord - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]));
}