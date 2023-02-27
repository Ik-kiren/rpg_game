if	(((mouse_x > oSummon_UI.x + 176) && (mouse_x < oSummon_UI.x + 227) && (mouse_y > oSummon_UI.y + 19) && (mouse_y < oSummon_UI.y + 34)) && mouse_check_button_pressed(mb_left)){
	if (oPlayer.player.souls >= 10 && gManager.ally == pointer_null){
		gManager.ally = new ally_construct("Ally", 8, 3);
		show_message("summoned ally");
		oPlayer.player.summonCost();
	}else if (gManager.ally != pointer_null){
		show_message("you already have an ally");
	}else{
		show_message("you don't have enough ressources");
	}
}

if	(((mouse_x > oSummon_UI.x + 176) && (mouse_x < oSummon_UI.x + 227) && (mouse_y > oSummon_UI.y + 55) && (mouse_y < oSummon_UI.y + 70)) && mouse_check_button_pressed(mb_left)){
	if (oPlayer.player.souls >= 20 && gManager.ally == pointer_null){
		gManager.ally = new ally_construct("Ally", 8, 3);
		show_message("summoned ally");
		oPlayer.player.summonCost();
	}else if (gManager.ally != pointer_null){
		show_message("you already have an ally");
	}else{
		show_message("you don't have enough ressources");
	}
}

if	(((mouse_x > oSummon_UI.x + 176) && (mouse_x < oSummon_UI.x + 227) && (mouse_y > oSummon_UI.y + 92) && (mouse_y < oSummon_UI.y + 107)) && mouse_check_button_pressed(mb_left)){
	if (oPlayer.player.souls >= 30 && gManager.ally == pointer_null){
		gManager.ally = new ally_construct("Ally", 8, 3);
		show_message("summoned ally");
		oPlayer.player.summonCost();
	}else if (gManager.ally != pointer_null){
		show_message("you already have an ally");
	}else{
		show_message("you don't have enough ressources");
	}
}
