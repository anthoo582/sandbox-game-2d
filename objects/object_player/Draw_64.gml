

var view_x = __view_get(e__VW.XView, 0);
var view_y = __view_get(e__VW.YView, 0);
var cursor_x = mouse_x;
var cursor_y = mouse_y;


var grid_x = floor(cursor_x / 32) * 32;
var grid_y = floor(cursor_y / 32) * 32;


var gui_x = grid_x - view_x;
var gui_y = grid_y - view_y;


draw_set_color(c_black);
draw_rectangle(gui_x, gui_y, gui_x + 31, gui_y + 31, true);



// Grid snapping for block placement

// Tooltip rendering on hover

// Improved UI layout

// Grid cursor: black outline on target block
