function __global_object_depths() {
	gml_pragma( "global", "__global_object_depths()");

	global.__objectDepths[0] = 0;
	global.__objectDepths[1] = 0;
	global.__objectDepths[2] = 0;
	global.__objectDepths[3] = 0;
	global.__objectDepths[4] = 0;
	global.__objectDepths[5] = -999;
	global.__objectDepths[6] = 0;
	global.__objectDepths[7] = 0;
	global.__objectDepths[8] = 0;
	global.__objectDepths[9] = 0;
	global.__objectDepths[10] = 0;
	global.__objectDepths[11] = 0;
	global.__objectDepths[12] = 0;
	global.__objectDepths[13] = 0;
	global.__objectDepths[14] = 0;
	global.__objectDepths[15] = 0;
	global.__objectDepths[16] = 0;
	global.__objectDepths[17] = 0;
	global.__objectDepths[18] = 0;
	global.__objectDepths[19] = 0;


	global.__objectNames[0] = "object_grass";
	global.__objectNames[1] = "object_dirt";
	global.__objectNames[2] = "object_stone";
	global.__objectNames[3] = "obj_tree";
	global.__objectNames[4] = "obj_leaf";
	global.__objectNames[5] = "object_water";
	global.__objectNames[6] = "object_block";
	global.__objectNames[7] = "object_ghost_block";
	global.__objectNames[8] = "object_generate";
	global.__objectNames[9] = "object_player";
	global.__objectNames[10] = "object_ore_coal";
	global.__objectNames[11] = "object_ore_iron";
	global.__objectNames[12] = "object_ore_gold";
	global.__objectNames[13] = "object_ore_diamond";
	global.__objectNames[14] = "object_piedra_base";
	global.__objectNames[15] = "object_plant_grass";
	global.__objectNames[16] = "object_plant_fern";
	global.__objectNames[17] = "object_flower_rose";
	global.__objectNames[18] = "obj_leaf";
	global.__objectNames[19] = "obj_tree";


	var len = array_length_1d (global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		}
	}


}


