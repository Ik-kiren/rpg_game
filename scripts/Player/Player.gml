
function player_construct(npc_name, npc_hp, npc_damage) constructor{
	o_name = npc_name;
	hp = npc_hp;
	damage = npc_damage;
	agility = 5;
	level = 1;
	xp = 0;
	xp_to_up = 10;
	harvest_speed = 20;
	souls = 9;
	pick_ups = 3;
	inventory = 
	[	
		["herb", 0],
		["stone", 0],
		["twig", 0],
	];
	
	equipements = 
	[
		["helmet", 1],
		["armor", 1],
		["sword", 1],
	];
	
	skills = 
	[
		["name", "damage", "effect"],
	];
	
	function takeDamage(damage){
		hp -= damage;
		if (hp < 0){
			hp = 0;
		}
	}
	
	function gainXp(xp_gained){
		xp += xp_gained;
		if(xp >= xp_to_up){
			level++;
			xp = 0;
			xp_to_up = int64(xp_to_up * 1.6);
			hp = int64(hp * 1.5);
			damage++;
		}
	}
	
	function addPickUp(){
		pick_ups++;
		if (pick_ups > 3){
			pick_ups = 3;
		}
	}
	
	function summonCost(){
		summon_gauge -= 10;
		pick_ups = 0;
	}
}

function ally_construct(npc_name, npc_hp, npc_damage, npc_agility) constructor{
	o_name = npc_name;
	hp = npc_hp;
	damage = npc_damage;
	agility = npc_agility;
	level = 1;
	xp = 0;
	xp_to_up = 10;
	sprite_index = sEnemy;
	
	function takeDamage(damage){
		hp -= damage;
		if (hp < 0){
			hp = 0;
		}
		return hp;
	}
	
	function gainXp(xp_gained){
		xp += xp_gained;
		if(xp >= xp_to_up){
			level++;
			xp = 0;
			xp_to_up = int64(xp_to_up * 1.6);
			hp = int64(hp * 1.5);
			damage++;
		}
	}
}