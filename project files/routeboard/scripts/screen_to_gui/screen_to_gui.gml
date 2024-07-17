/// @function screen_to_gui(distance);
/// @param {real} distance distance to be converted

function screen_to_gui(distance)
{
	return display_get_gui_width() * (distance / camera_get_view_width(view_camera[0]));
}