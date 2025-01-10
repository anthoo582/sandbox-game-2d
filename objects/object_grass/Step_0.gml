
if (fx_active) {
    
    if (mouse_check_button(mb_left)) {
        
        fx_prog = min(fx_prog + 1, fx_duration);
        if (fx_prog >= fx_duration) {
            
            
            
            var left  = bbox_left;
            var right = bbox_right;
            var top   = bbox_top;
            var bottom= bbox_bottom;

            
            var h = bottom - top;

            
            var x1 = left;
            var y1 = top - h;
            var x2 = right;
            var y2 = top - 1;

            var targets = [
                object_plant_grass,
                object_plant_fern,
                object_flower_allium,
                object_flower_blue_orchid,
                object_flower_cornflower,
                object_flower_dandelion,
                object_flower_houstonia,
                object_flower_lily_of_the_valley,
                object_flower_oxeye_daisy,
                object_flower_paeonia,
                object_flower_rose,
                object_flower_rose_blue,
                object_flower_tulip_orange,
                object_flower_tulip_pink,
                object_flower_tulip_red,
                object_flower_tulip_white
            ];

            for (var i = 0; i < array_length(targets); i++) {
                
                var inst = collision_rectangle(x1, y1, x2, y2, targets[i], false, true);
                while (inst != noone) {
                    with (inst) instance_destroy();
                    inst = collision_rectangle(x1, y1, x2, y2, targets[i], false, true);
                }

                
                var sx1 = left;
                var sy1 = top;
                var sx2 = right;
                var sy2 = bottom;
                inst = collision_rectangle(sx1, sy1, sx2, sy2, targets[i], false, true);
                while (inst != noone) {
                    with (inst) instance_destroy();
                    inst = collision_rectangle(sx1, sy1, sx2, sy2, targets[i], false, true);
                }
            }

            instance_destroy();
        }
    } else {
        
        fx_active = false;
        fx_prog = 0;
    }
}


// Block breaking with destroy particle spawn

// Fix: vegetation destruction on grass break
