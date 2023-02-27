instance_destroy(gManager);
instance_destroy(oPlayer);
camera_destroy(view_camera[0]);
draw_sprite(sGameOver, 0, room_width / 2, room_height / 2);

if (keyboard_check(vk_enter)){
	game_end();
}
