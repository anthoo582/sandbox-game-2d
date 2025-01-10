if global.alpha < 1 {
    global.alpha += 0.005;
    alarm[2] = alpha_trans;
} else {
    alarm[0] = time_cycle;
}

