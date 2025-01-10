min_ += incRease;

if (min_ > 60) { min_ = 0; hours++; }


if (hours == 0) {
    
    alpha_1 = 1;
    layer_background_sprite(back_id_1, spr_backGr_day);
    layer_background_sprite(back_id_2, spr_backGr_Morning);
}

if (hours == 8) {
    
    alpha_1 = 1;
    layer_background_sprite(back_id_1, spr_backGr_Morning);
    layer_background_sprite(back_id_2, spr_backGr_Night);
}

if (hours == 16) {
    
    alpha_1 = 1;
    layer_background_sprite(back_id_1, spr_backGr_Night);
    layer_background_sprite(back_id_2, spr_backGr_day);
}


if (hours < 8) {
    layer_background_sprite(back_id_1, spr_backGr_day);
    layer_background_sprite(back_id_2, spr_backGr_Morning);
} else if (hours < 16) {
    layer_background_sprite(back_id_1, spr_backGr_Morning);
    layer_background_sprite(back_id_2, spr_backGr_Night);
} else {
    layer_background_sprite(back_id_1, spr_backGr_Night);
    layer_background_sprite(back_id_2, spr_backGr_day);
}

if (hours > 23) { hours = 0; }

alpha_1 -= alphaDecrease;
alpha_1 = clamp(alpha_1, 0, 1);
layer_background_alpha(back_id_1, alpha_1);


// Hour-based: day(0-8), morning(8-16), night(16-24)
