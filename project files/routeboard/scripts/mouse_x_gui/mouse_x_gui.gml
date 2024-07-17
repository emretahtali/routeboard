// @function mouse_x_gui(landType, subimg, dir_enabled);
// @param {real} landType the type of build
// @param {real}  subimg
// @param {boolean}  dir_enabled if directions are enabled

//^^^^bu kısmı scriptlere misal teşkil etsin diye bıraktım^^^^ (iki değil üç slash gerekiyor.)

function mouse_x_gui()
{
	return display_get_gui_width() * ((mouse_x - camera_get_view_x(view_camera[0])) / camera_get_view_width(view_camera[0]));
}