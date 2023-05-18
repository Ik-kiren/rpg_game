/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

clicked_button = function()
{
	if (oPlayer.player.souls >= souls_cost && gManager.ally == pointer_null){
		gManager.ally = new ally_construct("Ally", 8, 3, 5);
		show_message("summoned ally");
		oPlayer.player.summonCost();
	}else if (gManager.ally != pointer_null){
		show_message("you already have an ally");
	}else{
		show_message("you don't have enough ressources");
	}
}
