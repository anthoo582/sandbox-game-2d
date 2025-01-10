
var support_found = false;

if (position_meeting(x, y + 1, object_grass) ||
    position_meeting(x, y + 2, object_grass) ||
    position_meeting(x, y + 16, object_grass) ||
    position_meeting(x, y + 32, object_grass)) {
    support_found = true;
}

if (!support_found) {
    instance_destroy();
}


