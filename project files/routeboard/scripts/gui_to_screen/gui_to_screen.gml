/// @function gui_to_screen(distance);
/// @param {real} distance distance to be converted

function gui_to_screen(distance)
{
	return camera_get_view_width(view_camera[0]) * (distance / display_get_gui_width());
}