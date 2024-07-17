//if (global.debugmode) application_surface_draw_enable(true);
if (1 != 1) {}
else
{
	application_surface_draw_enable(false);
	
	if (floor(window_get_width() * (9 / 16)) <= window_get_height())
	{
		var _width = window_get_width();
		var _height = _width * (9 / 16);
	}
	else
	{
		var _height = window_get_height();
		var _width = _height * (16 / 9);
	}
	
	var _x = window_get_width() / 2 - _width / 2;
	var _y = window_get_height() / 2 - _height / 2;
	
	#region bulgeStripes shader
	
	if (!global.debugmode)
	{
		shader_set(shBulgeStripes);
	
		var u_winResolution = shader_get_uniform(shBulgeStripes, "u_winResolution");
		shader_set_uniform_f(u_winResolution, window_get_width(), window_get_height());

		var u_resolution = shader_get_uniform(shBulgeStripes, "u_resolution");
		shader_set_uniform_f(u_resolution, _width, _height);
	
		var u_bulge = shader_get_uniform(shBulgeStripes, "u_bulge");
		shader_set_uniform_f(u_bulge, screen_bulge);
	
		draw_surface_ext(application_surface, _x, _y, _width / 1366, _height / 768, 0, c_white, 1);
		shader_reset();
	}
	else draw_surface_ext(application_surface, _x, _y, _width / 1366, _height / 768, 0, c_white, 1);
	
	#endregion
}