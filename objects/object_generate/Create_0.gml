randomize();

if (!variable_global_exists("world_seed")) {
    global.world_seed = irandom(1000000);
}
global.lastTreeX = -10000;

global.length = generate(0);
global.length2 = global.length;




// Global world seed for reproducibility

// Save data: player pos, world seed
