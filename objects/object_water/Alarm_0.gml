

var view_x = __view_get( e__VW.XView, 0 );
var view_y = __view_get( e__VW.YView, 0 );
var view_w = __view_get( e__VW.WView, 0 );
var view_h = __view_get( e__VW.HView, 0 );

if (x >= view_x && x <= view_x + view_w && y >= view_y - 64 && y <= view_y + view_h + 64)
{
    if(!place_meeting(x - 16, y, object_block) && !place_meeting(x - 16, y, object_ghost_block))
    {
        if (!position_meeting(x - 32, y, object_water)) instance_create( x - 32, y, object_water);
    }
    if(!place_meeting(x + 16, y, object_block) && !place_meeting(x + 16, y, object_ghost_block))
    {
        if (!position_meeting(x + 32, y, object_water)) instance_create( x + 32, y, object_water);
    }
    if(!place_meeting(x, y + 16, object_block) && !place_meeting(x, y + 16, object_ghost_block))
    {
        if (!position_meeting(x, y + 32, object_water)) instance_create( x, y + 32, object_water);
    }
}

alarm[0] = 45;




