if	(keyboard_check_pressed(ord("I"))){
	if	(instance_exists(oInventory)){
		instance_destroy(oInventory);
	}else{
		instance_create_layer(oPlayer.x, oPlayer.y, "UI",oInventory);
	}
}

if	(instance_exists(oInventory)){
	oInventory.x = camera_get_view_x(view_camera[0]) + 300;
	oInventory.y = camera_get_view_y(view_camera[0]) + 150;
}

if	(keyboard_check_pressed(ord("K"))){
	oPlayer.player.equipements[2][1] = 3;
}