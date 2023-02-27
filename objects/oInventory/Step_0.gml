if (((mouse_x > x + 31 && mouse_x < x + 57) && (mouse_y > y + 94 && mouse_y < y + 101)) && mouse_check_button_pressed(mb_left)){
	if (oPlayer.player.inventory[0][1] >= 3 && oPlayer.player.inventory[1][1] >= 3 && oPlayer.player.inventory[2][1] >= 3){
		oPlayer.player.inventory[0][1] -= 3;
		oPlayer.player.inventory[1][1] -= 3;
		oPlayer.player.inventory[2][1] -= 3;
		oPlayer.player.harvest_speed = 50;
	}
}