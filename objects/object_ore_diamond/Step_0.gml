
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


