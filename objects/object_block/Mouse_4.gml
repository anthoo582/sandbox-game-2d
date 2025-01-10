if(vis)
{
	with (instance_place(x, y - 32, object_plant_grass)) instance_destroy();
	with (instance_place(x, y - 32, object_plant_fern)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_rose)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_allium)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_blue_orchid)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_cornflower)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_dandelion)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_houstonia)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_lily_of_the_valley)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_oxeye_daisy)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_paeonia)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_rose_blue)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_tulip_orange)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_tulip_pink)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_tulip_red)) instance_destroy();
	with (instance_place(x, y - 32, object_flower_tulip_white)) instance_destroy();
	
	
	if (object_index != object_stone) {
		instance_destroy();
	}
}




// Destroy flowers above broken block
