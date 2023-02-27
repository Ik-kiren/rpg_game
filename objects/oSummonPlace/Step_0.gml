if	(keyboard_check_pressed(ord("E")) && place_meeting(x, y, oPlayer)){
	if	(instance_exists(oSummon_UI)){
		instance_destroy(oSummon_UI);
	}else{
		instance_create_layer(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, "UI", oSummon_UI);
	}
}
if	!(place_meeting(x, y, oPlayer) && instance_exists(oSummon_UI)){
	instance_destroy(oSummon_UI);
}