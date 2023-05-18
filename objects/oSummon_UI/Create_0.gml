/// @description Insert description here
// You can write your code in this editor

button_one = false;
button_two = false;

button_one = instance_create_depth(x + 201 ,y + 26 , 50, oSummonButton,{
	image_xscale : 4,
	image_yscale : 1.2
});

button_two = instance_create_depth(x + 201 ,y + 62 , 50, oSummonButton,{
	image_xscale : 4,
	image_yscale : 1.2,
	souls_cost : 20,
	ally_hp : 15,
	ally_damage : 10,
	ally_agility : 8
});