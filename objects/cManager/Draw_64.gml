for (i = 0; i < array_length(enemy_array); i++){
	draw_text(enemy_array[i].x, enemy_array[i].y + 65, enemy_array[i].enemy.o_name);
	draw_text(enemy_array[i].x, enemy_array[i].y + 80, enemy_array[i].enemy.hp);
}

if (gManager.ally != pointer_null){
	draw_text(c_ally.x, c_ally.y + 65, c_ally.o_name);
	draw_text(c_ally.x, c_ally.y + 80, c_ally.hp);
}

draw_text(oPlayer.x, oPlayer.y + 65, oPlayer.player.o_name);
draw_text(oPlayer.x, oPlayer.y + 80, oPlayer.player.hp);

switch (combat_phase){
	
	case phase.playerturn :
		draw_text(540, 700, "turn of : " + string(oPlayer.player.o_name));
	break;
		
	case phase.allyturn :
		draw_text(540, 700, "turn of : " + string(c_ally.o_name));
	break;
		
	case phase.enemyturn :
		draw_text(5440, 700, "turn of : enemies");
	break;
}
