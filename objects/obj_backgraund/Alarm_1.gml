if global.alpha > 0.1 {
    global.alpha -= 0.005;
    alarm[1] = alpha_trans;
} else {
    alarm[0] = time_cycle;
}

