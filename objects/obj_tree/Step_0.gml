if (canGrow)
{
    canGrow = false;
    
    
    function create_leaf_row(base_x, base_y, positions) {
        var lf;
        for (var i = 0; i < array_length(positions); i++) {
            var offset_x = positions[i];
            lf = instance_create(base_x + offset_x, base_y, obj_leaf);
            if (lf != noone) lf.depth = base_y - 29000;
        }
    }
    
    
    var trunk_height = irandom_range(2, 4);
    var trunk_start_y = y;
    
    
    for (var i = 0; i < trunk_height; i++) {
        var trunk_y = trunk_start_y - (i * 32); 
        var trunk_part = instance_create(x, trunk_y, obj_tree);
        if (trunk_part != noone) {
            trunk_part.depth = trunk_y - 30000;
        }
    }
    
    
    var leaves_base_y = y - (32 * trunk_height) - 32;
    
    
    var tree_style = irandom(3);
    
    switch(tree_style) {
        case 0: 
            create_leaf_row(x, leaves_base_y, [0, 32]);
            create_leaf_row(x, leaves_base_y-32, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-64, [-64, -32, 0, 32, 64, 96]);
            create_leaf_row(x, leaves_base_y-96, [-64, -32, 0, 32, 64, 96]);
            create_leaf_row(x, leaves_base_y-128, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-160, [0, 32]);
            break;
            
        case 1: 
            create_leaf_row(x, leaves_base_y, [0, 32]);
            create_leaf_row(x, leaves_base_y-32, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-64, [-96, -64, -32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-96, [-64, -32, 0, 32, 64, 96]);
            create_leaf_row(x, leaves_base_y-128, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-160, [0, 32]);
            break;
            
        case 2: 
            create_leaf_row(x, leaves_base_y, [0, 32]);
            create_leaf_row(x, leaves_base_y-32, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-64, [-96, -64, -32, 0, 32, 64, 96]);
            create_leaf_row(x, leaves_base_y-96, [-128, -96, -64, -32, 0, 32, 64, 96, 128]);
            create_leaf_row(x, leaves_base_y-128, [-96, -64, -32, 0, 32, 64, 96]);
            create_leaf_row(x, leaves_base_y-160, [-32, 0, 32, 64]);
            break;
            
        default: 
            create_leaf_row(x, leaves_base_y, [0]);
            create_leaf_row(x, leaves_base_y-32, [-32, 0, 32]);
            create_leaf_row(x, leaves_base_y-64, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-96, [-64, -32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-128, [-32, 0, 32, 64]);
            create_leaf_row(x, leaves_base_y-160, [-32, 0, 32]);
            create_leaf_row(x, leaves_base_y-192, [0, 32]);
            break;
    }
    
    
    var fill_positions = [
        [x-32, leaves_base_y-64],
        [x+96, leaves_base_y-64],
        [x-64, leaves_base_y-96],
        [x+128, leaves_base_y-96]
    ];
    
    for (var i = 0; i < array_length(fill_positions); i++) {
        if (random(1) < 0.6) { 
            var fill_x = fill_positions[i][0];
            var fill_y = fill_positions[i][1];
            var fill_leaf = instance_create(fill_x, fill_y, obj_leaf);
            if (fill_leaf != noone) fill_leaf.depth = fill_y - 29000;
        }
    }
}





if (fx_active) {
    
    if (mouse_check_button(mb_left)) {
        
        fx_prog = min(fx_prog + 1, fx_duration);
        if (fx_prog >= fx_duration) {
            
            instance_destroy();
        }
    } else {
        
        fx_active = false;
        fx_prog = 0;
    }
}


// 4 tree styles with varied leaf patterns
