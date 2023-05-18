player = new player_construct("Player", 20, 5);
harvest_time = 100;
harvest_bar = false;
object_harvested = 0;

key_up = ord("Z");
key_left = ord("Q");
key_down = ord("S");
key_right = ord("D");

function Check_position_idle()
{
	if(hspeed > 0 && vspeed == 0) oPlayer.sprite_index = sPlayer_idle_right;
	if(hspeed < 0 && vspeed == 0) oPlayer.sprite_index = sPlayer_idle_left;
	if(hspeed == 0 && vspeed > 0) oPlayer.sprite_index = sPlayer_idle_down;
	if(hspeed == 0 && vspeed < 0) oPlayer.sprite_index = sPlayer_idle_up;
	if(hspeed > 0 && vspeed > 0) oPlayer.sprite_index = sPlayer_idle_right;
	if(hspeed < 0 && vspeed > 0) oPlayer.sprite_index = sPlayer_idle_right;
	if(hspeed < 0 && vspeed < 0) oPlayer.sprite_index = sPlayer_idle_left;
	if(hspeed < 0 && vspeed > 0) oPlayer.sprite_index = sPlayer_idle_left;
}

state_roaming = function (){
	hspeed = 0;
	vspeed = 0;
	if(keyboard_check(vk_up) || keyboard_check(key_up)) {
		vspeed = -2;
		oPlayer.sprite_index = sPlayer_up;
	}
	if(keyboard_check_released(vk_up) || keyboard_check_released(key_up)) oPlayer.sprite_index = sPlayer_idle_up;
	if(keyboard_check(vk_down) || keyboard_check(key_down)) {
		vspeed = 2;
		oPlayer.sprite_index = sPlayer_down;
	}
	if(keyboard_check_released(vk_down) || keyboard_check_released(key_down)) oPlayer.sprite_index = sPlayer_idle_down;
	if(keyboard_check(vk_right) || keyboard_check(key_right)) {
		hspeed = 2;
		oPlayer.sprite_index = sPlayer_right;
	}
	if(keyboard_check_released(vk_right) || keyboard_check_released(key_right)) oPlayer.sprite_index = sPlayer_idle_right;
	if(keyboard_check(vk_left) || keyboard_check(key_left)) {
		hspeed = -2;
		oPlayer.sprite_index = sPlayer_left;
	}
	if(keyboard_check_released(vk_left) || keyboard_check_released(key_left)) oPlayer.sprite_index = sPlayer_idle_left;
	if(keyboard_check(vk_nokey))
	{
		hspeed = 0;
		vspeed = 0;
	}
	if(place_meeting(x, y + vspeed, oTree) || place_meeting(x, y + vspeed, oCollision) == true) vspeed = 0;
	if(place_meeting(x + hspeed, y, oTree) || place_meeting(x + hspeed, y, oCollision) == true) hspeed = 0;
	
}

state_combat = function (){	
	hspeed = 0;
	vspeed = 0;
}

state_harvesting = function (){
	Check_position_idle();
	hspeed = 0;
	vspeed = 0;
	harvest_bar = true;
	timeline_index = HarvestTimeline;
	if !(timeline_running){
		timeline_position = 0;
		timeline_running = true;
		timeline_speed = 1;
		timeline_loop = true;
	}
	timeline_name = timeline_get_name(timeline_index);
	if (harvest_time <= 0){
		timeline_running = false;
		harvest_bar = false;
		state = state_roaming;
		object_harvested.visible = false;
	}
}
state = state_roaming;
