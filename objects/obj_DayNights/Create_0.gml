min_ = 0;
hours = 0;
incRease = 1; 


alphaTimeTotal = 6 * 60;
alphaDecrease = incRease / alphaTimeTotal; 

alpha_1 = 1;

var lay_id_1 = layer_get_id("Background_1");
back_id_1 = layer_background_get_id(lay_id_1);

var lay_id_2 = layer_get_id("Background_2");
back_id_2 = layer_background_get_id(lay_id_2);


// Alpha fade: 6-min transition cycle
