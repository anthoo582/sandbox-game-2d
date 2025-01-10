
if (sprite_index != -1) {
    draw_self();
}


if (fx_active && fx_duration > 0) {
    var pct = clamp(fx_prog / fx_duration, 0, 1);
    var ox = x;
    var oy = y - fx_offset_y; 

    
    var spr_name = "sprite_destroy";
    var spr_idx = asset_get_index(spr_name);
    if (spr_idx != -1) {
        
        var frames = max(1, sprite_get_number(spr_idx));
        
        var frame = clamp(floor(pct * frames), 0, frames - 1);
        draw_sprite_ext(spr_idx, frame, ox, oy, 1, 1, 0, c_white, 1);
    } else {
        
        var w = 28; 
        var h = 6;  
        var x1 = ox - w/2;
        var y1 = oy - 20;
        var x2 = x1 + w;
        var y2 = y1 + h;

        
        draw_set_alpha(0.6);
        draw_set_color(c_black);
        draw_rectangle(x1, y1, x2, y2, false);

        
        draw_set_alpha(0.9);
        draw_set_color(make_color_rgb(64, 64, 64)); 
        draw_rectangle(x1 + 1, y1 + 1, x1 + 1 + floor((w - 2) * pct), y2 - 1, false);

        
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_rectangle(x1, y1, x2, y2, true);
    }
}


