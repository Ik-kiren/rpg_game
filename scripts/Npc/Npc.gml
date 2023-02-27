
function npc_construct(npc_name, npc_hp, npc_damage, npc_agility, npc_level, npc_souls) constructor{
	o_name = npc_name;
	hp = npc_hp;
	damage = npc_damage;
	agility = npc_agility;
	level = npc_level;
	souls = npc_souls;
	
	function takeDamage(damage){
		hp -= damage;
		if (hp < 0){
			hp = 0;
		}
		return hp;
	}
}

function npc_name(nb){
	var random_array = ["enemy","enemy1","enemy2","enemy3","enemy4","enemy5","enemy6","enemy7","enemy8","enemy9","enemy10","enemy11"];
	return random_array[nb];
}