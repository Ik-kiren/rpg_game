enemy_array = [];
choose_target = 0;
check_attackbutton = 0;
randomise_target = 0;
clicked_enemy = 0;

oPlayer.sprite_index = sPlayer_idle_right;

enum phase {
	init,
	playerturn,
	allyturn,
	enemyturn,
	endfight,
	gameover,
}

combat_phase = phase.init;


function create_combat_ui(){
	attack_button = instance_create_depth(camera_get_view_x(view_camera[0]), gManager.camera_height, 0, attackButton);
	return attack_button;
}

function combat_ui_on(attack_button){
	if(attack_button.visible == false){
		instance_activate_object(attack_button);
		attack_button.visible = true;
	}
}

function combat_ui_off(attack_button){
	if(attack_button.visible == true){
		instance_deactivate_object(attack_button);
		attack_button.visible = false;
	}
}

function isendfight(enemy_array){
	i = 0;
	if (gManager.ally == pointer_null){
		if (oPlayer.player.hp <= 0){
			return 2;
		}
	}
	else{
		if (oPlayer.player.hp <= 0 && c_ally.hp <= 0){
			return 2;
		}
	}
	for(i = 0; i < array_length(enemy_array); i++){
		if (enemy_array[i].enemy.hp > 0)
			return 0;
	}
	return 1;
}
