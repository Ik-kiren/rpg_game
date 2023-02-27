gManager.enemy_number = other.enemy_number;
gManager.player_x = self.x;
gManager.player_y = self.y;
self.state = self.state_combat;
instance_destroy(other);
gManager.camera_x = view_xport[0];
gManager.camera_y = view_yport[0];
room_goto(Room2);

