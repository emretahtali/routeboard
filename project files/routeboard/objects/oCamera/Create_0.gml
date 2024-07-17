target = -1;

cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

//x = irandom_range(cam_width / 2, room_width - cam_width / 2);
//y = irandom_range(cam_height / 2, room_height - cam_height / 2);

zoom = 0;
zoom_target = 0;
zoom_scale = 1;

mouse_saved_x = 0;
mouse_saved_y = 0;

cam_left_x = 0;
cam_top_y = 0;

cam_default_width = 1366;
cam_default_height = 768;

drag_saved_x = 0;
drag_saved_y = 0;
drag_cam_saved_x = 0;
drag_cam_saved_y = 0;

timer = 0;
speed_x = 0;
speed_y = 0;
pre_x = 0;
pre_y = 0;