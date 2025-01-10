
if (image_index >= sprite_get_number(sprite_index) - 1) {
    
    image_speed = 0;
    
    if (!variable_instance_exists(id, "destroy_timer")) {
        destroy_timer = 10; 
    } else {
        destroy_timer--;
        if (destroy_timer <= 0) {
            instance_destroy();
        }
    }
}


