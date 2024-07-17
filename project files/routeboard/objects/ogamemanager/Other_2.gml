randomize();

global.debugmode = false;
global.game_unfocused = false;

global.holditem = -1;
global.hovered_item = -1;
global.focused_item = -1;

global.escape_queue = ds_stack_create();
enum escape_from
{
	menu,
	game,
	save_window
}
ds_stack_push(global.escape_queue, escape_from.menu);

global.file_name = "";

right_click_x = 0;
right_click_y = 0;

room_goto_next();