randomize();
player_name = get_string("nom du joueur :", "default");

oPlayer.player.o_name = player_name;

player_x = 0;
player_y = 0;
camera_x = view_xport[0];
camera_y = view_yport[0];

ally = pointer_null;
enemy_number = 1;