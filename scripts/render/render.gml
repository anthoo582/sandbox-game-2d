function render() {
	instance_deactivate_object(object_block);
	instance_deactivate_object(object_ghost_block);
	instance_activate_region(__view_get( e__VW.XView, 0 ) - 64, __view_get( e__VW.YView, 0 ) - 64, __view_get( e__VW.WView, 0 ) + 128, __view_get( e__VW.HView, 0 ) + 128, true);



}



// Deactivate off-screen blocks

// Viewport activation region: +/- 64px margin

// Render: deactivate all, activate viewport region
