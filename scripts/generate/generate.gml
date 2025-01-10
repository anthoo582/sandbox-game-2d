function generate(argument0) {
    var sh = (room_height / 2) + floor(random(room_height / 4));
    sh = (sh div 32) * 32;
    var starting_room = argument0;
    var ending_room   = argument0 + room_width;
    var ah = sh; 
    
    var terrain_direction = 0;
    var direction_counter = 0;
    var max_direction_length = irandom_range(8, 15);
    
    var grass_count = 0;
    var dirt_count = 0;
    var stone_count = 0;
    var tree_count = 0;
    var coal_count = 0;
    var iron_count = 0;
    var gold_count = 0;
    var diamond_count = 0;
    var plant_grass_count = 0;
    var fern_count = 0;
    var flower_count = 0;
    var leaf_count = 0;
    var lastTreeX = -1000;
    
    for (var xx = starting_room; xx < ending_room; xx += 32)
    {
        
        var min_height = 96;
        var max_height = room_height - 224;
        min_height = (min_height div 32) * 32;
        max_height = (max_height div 32) * 32;
        
        
        ah = clamp(ah, min_height, max_height);
        ah = (ah div 32) * 32;
        
        var current_column_height = ah;
        var dirt_depth = 5;
        
        
        var grass_inst = instance_create(xx, current_column_height, object_grass);
        if (grass_inst != noone) {
            grass_inst.depth = current_column_height - 20000;
            grass_count++;
        }
        
        
        var plant_chance = irandom(100);
        if (plant_chance < 25) {
            var flower_y = current_column_height - 32;
            if (flower_y >= 0) {
                var flower_type = irandom(13);
                var flower_inst = noone;
                
                switch (flower_type) {
                    case 0:
                        flower_inst = instance_create(xx, flower_y, object_flower_rose);
                        break;
                    case 1:
                        flower_inst = instance_create(xx, flower_y, object_flower_allium);
                        break;
                    case 2:
                        flower_inst = instance_create(xx, flower_y, object_flower_blue_orchid);
                        break;
                    case 3:
                        flower_inst = instance_create(xx, flower_y, object_flower_cornflower);
                        break;
                    case 4:
                        flower_inst = instance_create(xx, flower_y, object_flower_dandelion);
                        break;
                    case 5:
                        flower_inst = instance_create(xx, flower_y, object_flower_houstonia);
                        break;
                    case 6:
                        flower_inst = instance_create(xx, flower_y, object_flower_lily_of_the_valley);
                        break;
                    case 7:
                        flower_inst = instance_create(xx, flower_y, object_flower_paeonia);
                        break;
                    case 8:
                        flower_inst = instance_create(xx, flower_y, object_flower_rose_blue);
                        break;
                    case 9:
                        flower_inst = instance_create(xx, flower_y, object_flower_tulip_orange);
                        break;
                    case 10:
                        flower_inst = instance_create(xx, flower_y, object_flower_tulip_pink);
                        break;
                    case 11:
                        flower_inst = instance_create(xx, flower_y, object_flower_tulip_red);
                        break;
                    case 12:
                        flower_inst = instance_create(xx, flower_y, object_flower_tulip_white);
                        break;
                    case 13:
                        flower_inst = instance_create(xx, flower_y, object_flower_oxeye_daisy);
                        break;
                    default:
                        flower_inst = instance_create(xx, flower_y, object_flower_rose);
                        break;
                }
                
                if (flower_inst != noone) {
                    flower_inst.depth = flower_y - 25000;
                    flower_count++;
                }
            }
        }
        else if (plant_chance < 50) {
            var fern_y = current_column_height - 32;
            if (fern_y >= 0) {
                var fern_inst = instance_create(xx, fern_y, object_plant_fern);
                if (fern_inst != noone) {
                    fern_inst.depth = fern_y - 25000;
                    fern_count++;
                }
            }
        }
        else if (plant_chance < 70) {
            var plant_y = current_column_height - 32;
            if (plant_y >= 0) {
                var plant_inst = instance_create(xx, plant_y, object_plant_grass);
                if (plant_inst != noone) {
                    plant_inst.depth = plant_y - 25000;
                    plant_grass_count++;
                }
            }
        }
        
        
        for (var i = 1; i < dirt_depth + 1; i++) {
            var dirt_y = current_column_height + (i * 32);
            if (dirt_y < room_height) {
                var dirt_inst = instance_create(xx, dirt_y, object_dirt);
                if (dirt_inst != noone) {
                    dirt_inst.depth = dirt_y - 10000;
                    dirt_count++;
                }
            }
        }
        
        
        var stone_start_y = current_column_height + ((dirt_depth + 1) * 32);
        var extra_depth = 30 * 32;
        var final_depth = room_height + extra_depth;
        
        for (var yy = stone_start_y; yy < final_depth; yy += 32) {
            var world_depth = final_depth - yy;
            var block_created = false;
            
            var block_type = "stone";
            var random_chance = irandom(100);
            
            if (world_depth <= 160 && world_depth > 32 && random_chance < 2) {
                block_type = "diamond";
            }
            else if (world_depth <= 320 && world_depth > 64 && random_chance < 4) {
                block_type = "gold";
            }
            else if (world_depth <= 500 && world_depth > 64 && random_chance < 10) {
                block_type = "iron";
            }
            else if (world_depth >= 32 && world_depth <= 900 && random_chance < 18) {
                block_type = "coal";
            }
            
            if (yy >= final_depth - 32) {
                var base_stone_inst = instance_create(xx, yy, object_piedra_base);
                if (base_stone_inst != noone) {
                    base_stone_inst.depth = yy;
                    stone_count++;
                    block_created = true;
                }
            } else {
                switch (block_type) {
                    case "diamond":
                        var diamond_inst = instance_create(xx, yy, object_ore_diamond);
                        if (diamond_inst != noone) {
                            diamond_inst.depth = yy + 1;
                            diamond_count++;
                            block_created = true;
                        }
                        break;
                        
                    case "gold":
                        var gold_inst = instance_create(xx, yy, object_ore_gold);
                        if (gold_inst != noone) {
                            gold_inst.depth = yy + 1;
                            gold_count++;
                            block_created = true;
                        }
                        break;
                        
                    case "iron":
                        var iron_inst = instance_create(xx, yy, object_ore_iron);
                        if (iron_inst != noone) {
                            iron_inst.depth = yy + 1;
                            iron_count++;
                            block_created = true;
                        }
                        break;
                        
                    case "coal":
                        var coal_inst = instance_create(xx, yy, object_ore_coal);
                        if (coal_inst != noone) {
                            coal_inst.depth = yy + 1;
                            coal_count++;
                            block_created = true;
                        }
                        break;
                        
                    default:
                        var stone_inst = instance_create(xx, yy, object_stone);
                        if (stone_inst != noone) {
                            stone_inst.depth = yy;
                            stone_count++;
                            block_created = true;
                        }
                        break;
                }
            }
            
            
            if (!block_created) {
                var emergency_stone = instance_create(xx, yy, object_stone);
                if (emergency_stone != noone) {
                    emergency_stone.depth = yy;
                    stone_count++;
                }
            }
        }
        
        
        if (current_column_height >= 64) {
            if (irandom(100) < 6 && (xx - lastTreeX) >= (32 * 25)) {
                var tree_y = current_column_height - 32;
                var tree_type = irandom(100);
                
                if (tree_type < 70) {
                    var trunk_height = irandom_range(4, 6);
                    for (var t = 0; t < trunk_height; t++) {
                        var trunk_y = tree_y - (t * 32);
                        if (trunk_y >= 0) {
                            var trunk_inst = instance_create(xx, trunk_y, obj_tree);
                            if (trunk_inst != noone) {
                                trunk_inst.canGrow = true;
                                trunk_inst.depth = trunk_y - 30000;
                                tree_count++;
                            }
                        }
                    }
                    
                    var leaf_start = tree_y - (trunk_height * 32);
                    var leaf_radius = 2;
                    
                    for (var lx = -leaf_radius; lx < leaf_radius + 1; lx++) {
                        for (var ly = -leaf_radius; ly < leaf_radius + 1; ly++) {
                            for (var lz = -leaf_radius; lz < leaf_radius + 1; lz++) {
                                if (lx * lx + ly * ly + lz * lz <= leaf_radius * leaf_radius) {
                                    var leaf_x = xx + (lx * 32);
                                    var leaf_y = leaf_start + (ly * 32);
                                    
                                    if (leaf_x >= 0 && leaf_x < room_width && leaf_y >= 0) {
                                        var leaf_inst = instance_create(leaf_x, leaf_y, obj_leaf);
                                        if (leaf_inst != noone) {
                                            leaf_inst.depth = leaf_y - 29000;
                                            leaf_count++;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                lastTreeX = xx;
            }
        }
        
        
        direction_counter++;
        var old_ah = ah;
        
        
        var mountain_chance = irandom(100);
        if (mountain_chance < 3) { 
            terrain_direction = -1; 
            max_direction_length = irandom_range(15, 25); 
            direction_counter = 0;
        }
        else if (direction_counter >= max_direction_length || irandom(100) < 20) {
            terrain_direction = choose(-1, 0, 1);
            direction_counter = 0;
            max_direction_length = irandom_range(8, 18);
        }
        
        var height_change = 0;
        
        if (terrain_direction == 1) {
            var height_roll = irandom(100);
            if (height_roll < 40) height_change = -32;
            else if (height_roll < 70) height_change = -64; 
            else if (height_roll < 85) height_change = 0;
            else height_change = 32;
        }
        else if (terrain_direction == -1) {
            var height_roll = irandom(100);
            if (height_roll < 40) height_change = 32;
            else if (height_roll < 70) height_change = 64; 
            else if (height_roll < 85) height_change = 0;
            else height_change = -32;
        }
        else {
            var height_roll = irandom(100);
            if (height_roll < 50) height_change = 0;
            else if (height_roll < 75) height_change = -32;
            else height_change = 32;
        }
        
        
        var new_ah = ah + height_change;
        
        
        var height_difference = abs(new_ah - old_ah);
        if (height_difference > 96) { 
            if (new_ah > old_ah) {
                new_ah = old_ah + 64;
            } else {
                new_ah = old_ah - 64;
            }
        }
        
        
        new_ah = (new_ah div 32) * 32;
        
        
        ah = clamp(new_ah, min_height, max_height);
        ah = (ah div 32) * 32;
    }
    
    
    show_debug_message("=== ESTADÍSTICAS DE GENERACIÓN ===");
    show_debug_message("Grass: " + string(grass_count));
    show_debug_message("Dirt: " + string(dirt_count)); 
    show_debug_message("Stone: " + string(stone_count));
    show_debug_message("Coal: " + string(coal_count));
    show_debug_message("Iron: " + string(iron_count));
    show_debug_message("Gold: " + string(gold_count));
    show_debug_message("Diamond: " + string(diamond_count));
    show_debug_message("Trees: " + string(tree_count));
    show_debug_message("Flowers: " + string(flower_count));
    show_debug_message("Ferns: " + string(fern_count));
    show_debug_message("Plant Grass: " + string(plant_grass_count));
    show_debug_message("Leaves: " + string(leaf_count));
    
    return ending_room;
}


// Basic terrain: grass, dirt layers, stone base

// Direction system: up/down/flat with variable length

// Vegetation: 25% flowers, 25% fern, 20% grass

// 14 flower types, random placement above grass

// Ores: coal 18%, iron 10%, gold 4%, diamond 2%

// Debug: generation stats output
