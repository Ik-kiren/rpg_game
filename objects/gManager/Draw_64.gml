if(room != Room2){
	draw_text(view_wport[0] / 2, view_hport[0] - 75, oPlayer.player.souls);
	for(i = 0; i < oPlayer.player.pick_ups && i < 3; i++){
		draw_sprite(sPick_up, 0, view_wport[0] / 2.2 + i * 50, view_hport[0] - 50)
	}
}
