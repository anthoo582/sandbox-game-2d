
var target_x = object_player.x;
var target_y = object_player.y;


var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);
var room_w = room_width;
var room_h = room_height;


target_x = clamp(target_x, cam_w/2, room_w - cam_w/2);
target_y = clamp(target_y, cam_h/2, room_h - cam_h/2);


if (x != target_x) {
    x += (target_x - x) * 0.1;
}


var min_y = 360; 
target_y = max(min_y, target_y); 

if (y != target_y) {
    y += (target_y - y) * 0.1;
}


y = clamp(y, cam_h/2, room_h - cam_h/2);


// Camera clamp to room bounds
