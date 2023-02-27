switch (combat_phase){
	case phase.init:
		track_turns = 0;
		combat_turns = [
			[oPlayer, oPlayer.player.agility, phase.playerturn],
		];
		combat_ui = create_combat_ui();
		combat_ui_off(combat_ui);
		oPlayer.x = view_xport[0] + 200;
		oPlayer.y = view_yport[0] + 200;
		for ( i = 0; i <= gManager.enemy_number - 1; i++){
			enemy_array[i] = instance_create_depth(camera_width / 1.3, camera_height / 3.5 + i * 95, 0, oEnemy);
			combat_turns[i + 1][0] = enemy_array[i];
			combat_turns[i + 1][1] = enemy_array[i].enemy.agility;
			combat_turns[i + 1][2] = phase.enemyturn;
		}
		if (gManager.ally != pointer_null){
			var a_length = array_length(combat_turns);
			combat_turns[a_length][0] = gManager;
			combat_turns[a_length][1] = gManager.ally.agility;
			combat_turns[a_length][2] = phase.allyturn;
		}
		show_debug_message(combat_turns);
		for (var i = 0; i < array_length(combat_turns) - 1; i++){
			for (var j = 0; j < array_length(combat_turns)- i - 1; j++){
				if	(combat_turns[j][1] < combat_turns[j + 1][1]){
					var temp = combat_turns[j][0];
					var temp_a = combat_turns[j][1];
					var temp_b = combat_turns[j][2];
					combat_turns[j][0] = combat_turns[j + 1][0];
					combat_turns[j][1] = combat_turns[j + 1][1];
					combat_turns[j][2] = combat_turns[j + 1][2];
					combat_turns[j + 1][0] = temp;
					combat_turns[j + 1][1] = temp_a;
					combat_turns[j + 1][2] = temp_b;
				}
			}
		}
		show_debug_message(combat_turns);
		if (gManager.ally != pointer_null){
			c_ally = instance_create_depth(320, 450, 0, oAlly, gManager.ally);
			c_ally.sprite_index = sEnemy;
		}
		combat_phase = combat_turns[track_turns][2]; //phase.playerturn;
	break;
		
	case phase.playerturn:
		if(oPlayer.player.hp <= 0){
			combat_phase = phase.allyturn;
		}
		combat_ui_on(combat_ui);
		if ((position_meeting(mouse_x, mouse_y, attackButton) && mouse_check_button_pressed(mb_left))){
			for (i = 0; i < array_length(enemy_array); i++){
				if (enemy_array[i].enemy.hp > 0){
					instance_create_layer(enemy_array[i].x , enemy_array[i].y - 40, "Instances", oAttackCursor);
				}
			}
			check_attackbutton = 1;
		}
		if ((position_meeting(mouse_x, mouse_y, oEnemy) && mouse_check_button_pressed(mb_left) && check_attackbutton == 1 && instance_position(mouse_x, mouse_y, oEnemy).enemy.hp > 0)){
			instance_position(mouse_x, mouse_y, oEnemy).enemy.takeDamage(oPlayer.player.damage);
			show_message(string(oPlayer.player.o_name) + " a mit " + string(oPlayer.player.damage) + " de degats à " + string(instance_position(mouse_x, mouse_y, oEnemy).enemy.o_name));
			instance_destroy(oAttackCursor);
			check_attackbutton = 0;
			if(isendfight(enemy_array) == 1){
				combat_phase = phase.endfight;
			}
			else{
				if(gManager.ally == pointer_null){
					track_turns += 1;
					if(track_turns == array_length(combat_turns)){
						track_turns = 0;
					}
					combat_phase = combat_turns[track_turns][2];;	
				}
				else if (isendfight(enemy_array) == 2){
					combat_phase = phase.gameover;
				}
				else{
					track_turns += 1;
					if(track_turns == array_length(combat_turns)){
						track_turns = 0;
					}
					combat_phase = combat_turns[track_turns][2]; //phase.allyturn;
				}
			}
		}
	break;
	
	case phase.allyturn:
		combat_ui_on(combat_ui);
		if(c_ally.hp <= 0){
			combat_phase = phase.enemyturn;
		}
		if (position_meeting(mouse_x, mouse_y, oEnemy) && mouse_check_button_pressed(mb_left) && check_attackbutton == 1 && instance_position(mouse_x, mouse_y, oEnemy).enemy.hp > 0){
			instance_position(mouse_x, mouse_y, oEnemy).enemy.takeDamage(c_ally.damage);
			show_message(string(c_ally.o_name) + " a mit " + string(c_ally.damage) + " de degats à " + string(instance_position(mouse_x, mouse_y, oEnemy).enemy.o_name));
			check_attackbutton = 0;
			if(isendfight(enemy_array) == 1){
				combat_phase = phase.endfight;
			}
			else if (isendfight(enemy_array) == 2){
				combat_phase = phase.gameover;
			}
			else{
				track_turns += 1;
				if(track_turns == array_length(combat_turns)){
					track_turns = 0;
				}
				combat_phase = combat_turns[track_turns][2];//phase.enemyturn;
			}
		}
	break;
	
	case phase.enemyturn:
		combat_ui_off(combat_ui);
		randomise_target = irandom_range(0, 1);
			if (combat_turns[track_turns][0].enemy.hp > 0){
				if (randomise_target == 1 || gManager.ally == pointer_null || c_ally.hp == 0 && oPlayer.player.hp > 0){
					show_message(string(combat_turns[track_turns][0].enemy.o_name) + " a mit " + string(combat_turns[track_turns][0].enemy.damage) + " de degats à " + string(oPlayer.player.o_name));
					oPlayer.player.takeDamage(combat_turns[track_turns][0].enemy.damage);
				}
				else if (randomise_target == 0 && gManager.ally != pointer_null && c_ally.hp > 0){
					show_message(string(combat_turns[track_turns][0].enemy.o_name) + " a mit " + string(combat_turns[track_turns][0].enemy.damage) + " de degats à " + string(c_ally.o_name));
					c_ally.hp = c_ally.takeDamage(combat_turns[track_turns][0].enemy.damage);
				}
			}
		if(isendfight(enemy_array) == 1){
			combat_phase = phase.endfight;
		}
		else if (isendfight(enemy_array) == 2){
			combat_phase = phase.gameover;
		}
		else{
			track_turns += 1;
			if(track_turns == array_length(combat_turns)){
				track_turns = 0;
			}
			combat_phase = combat_turns[track_turns][2];
		}
	break;
	
	case phase.endfight:
		if (gManager.ally != pointer_null){
			gManager.ally.hp = c_ally.hp;
			for(i = 0; i < array_length(enemy_array); i++){
				oPlayer.player.gainXp(int64(enemy_array[i].enemy.level / 2));
				c_ally.gainXp(int64(enemy_array[i].enemy.level / 2));
			}
		}
		else{
			for(i = 0; i < array_length(enemy_array); i++){
				oPlayer.player.gainXp(int64(enemy_array[i].enemy.level));
				oPlayer.player.souls += enemy_array[i].enemy.souls;
			}
		}
		oPlayer.state = oPlayer.state_roaming;
		room_goto(Room1);
		oPlayer.x = gManager.player_x;
		oPlayer.y = gManager.player_y;
	break;
	
	case phase.gameover:
		room_goto(rGameOver);
	break;
}