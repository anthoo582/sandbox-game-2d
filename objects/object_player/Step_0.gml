var time_scale = 30 / game_get_speed(gamespeed_fps);
if(place_free(x,y+1))
    gravity = 1 * time_scale;
else
    gravity = 0;
is_moving = false;
is_running = false;
if(keyboard_check(ord("D"))) { 
    if(keyboard_check(vk_shift)) {
        x += 8 * time_scale;
        is_running = true;
    } else {
        x += 5 * time_scale;
        is_running = false;
    }
    facing = 1; 
    image_speed = 0.5 * time_scale; 
    is_moving = true;
}
if(keyboard_check(ord("A"))) { 
    if(x > 0) {
        if(keyboard_check(vk_shift)) {
            x -= 8 * time_scale;
            is_running = true;
        } else {
            x -= 5 * time_scale;
            is_running = false;
        }
        facing = -1; 
        image_speed = 0.5 * time_scale; 
        is_moving = true;
    }
}
if(keyboard_check_pressed(vk_space)){
    if(place_meeting(x,y + 16,object_block) || place_meeting(x,y + 16,object_piedra_base) || place_meeting(x,y + 16,obj_leaf) || place_meeting(x,y + 16,obj_tree)){
        vspeed -= 15 * time_scale; 
        is_jumping = true;
        jump_animation_started = false;
    }
}
if(is_jumping && vspeed >= 0) {
    if(place_meeting(x,y + 16,object_block) || place_meeting(x,y + 16,object_piedra_base) || place_meeting(x,y + 16,obj_leaf) || place_meeting(x,y + 16,obj_tree)){
        is_jumping = false;
        jump_animation_started = false;
    }
}
if(is_jumping) {
    if(sprite_index != spr_player_jump || !jump_animation_started) {
        sprite_index = spr_player_jump; 
        image_index = 0; 
        image_speed = 0.15;
        jump_animation_started = true;
    }
}
else { 
    if(is_moving) {
        if(is_running) {
            if(sprite_index != spr_player_runnig) {
                sprite_index = spr_player_runnig; 
                image_index = 0; 
                image_speed = 0.8 * time_scale;
            }
        } else {
            if(sprite_index != sprite_player) {
                sprite_index = sprite_player; 
                image_index = 0; 
                image_speed = 0.5 * time_scale;
            }
        }
    } else {
        if(sprite_index != spr_player_still) {
            sprite_index = spr_player_still; 
            image_speed = 0; 
            image_index = 0; 
        }
    }
}

var target_x = x - (__view_get(e__VW.WView, 0) / 2);
var target_y = y - (__view_get(e__VW.HView, 0) / 2);
if(target_x < 0) target_x = 0;
__view_set(e__VW.XView, 0, target_x);
__view_set(e__VW.YView, 0, target_y);

if(facing == 1) {
    if(x >= (global.length / 2) && canCreate) {
        canCreate = false;
        global.length = generate(global.length);
        canCreate = true;
    }
}
else if(facing == -1) {
    if(x <= (global.length2 / 2) && canCreate) {
        canCreate = false;
        global.length2 = generate(global.length2 - 3200);
        canCreate = true;
    }
}



// Player movement: A/D keys, space jump

// Code style cleanup

// State machine: idle/walk/run/jump transitions

// Sprint: 8px/frame with Shift held

// Fall damage when vspeed > threshold

// FPS-independent: time_scale = 30/fps

// Fix: collision edge cases with trees
