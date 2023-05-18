if (keyboard_check_pressed(ord("E")) && other.harvested = false){
	player.inventory[other.inventory_id][1] += 1;
	harvest_time = 100;
	state = state_harvesting;
	object_harvested = other.id;
	other.harvested = true;
	other.alarm[0] = 600;
}