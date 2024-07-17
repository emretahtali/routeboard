screen_bulge = .2;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

toolbar = ds_grid_create(6, 4);
toolbar[# 4, 0] = 1;
toolbar[# 4, 1] = 1;
toolbar[# 4, 2] = 1;
toolbar[# 4, 3] = 1;

tool_menu = false;
tool_menu_x = 0;
tool_menu_y = 0;
tool_menu_size = 0;
tool_menu_hovered = -1;
tool_menu_list = ds_list_create();
tool_menu_list[|0] = "theme";

file_window_game_end = false;
file_window = false;
fw_tb_blink = "|";
fw_tb_blink_timer = 30;

gui_surf = 1;