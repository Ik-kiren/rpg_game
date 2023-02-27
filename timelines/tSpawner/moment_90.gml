if (instance_number(oTwig) < 5 && instance_number(oHerb) < 5 && instance_number(oStone) < 5){
	random_number = irandom_range(0, 2);
	switch (random_number){
		case 0:
			instance_create_layer(irandom_range(0, 2000), irandom_range(0, 750), "Instances_1", oStone);
		break;
		
		case 1:
			instance_create_layer(irandom_range(0, 2000), irandom_range(0, 750), "Instances_1", oHerb);
		break;
		
		case 2:
			instance_create_layer(irandom_range(0, 2000), irandom_range(0, 750), "Instances_1", oTwig);
		break;
	}
}