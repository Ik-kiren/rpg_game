if (keyboard_check_pressed(ord("E"))){
	oPlayer.player.inventory[2][1] += 1;
	oPlayer.harvest_time = 100;
	oPlayer.state = oPlayer.state_harvesting;
	oPlayer.object_to_destroy = id;
}
