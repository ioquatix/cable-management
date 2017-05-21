$fn = 200;

include <flange.scad>

total_wall_depth = 110;
hole_radius = 45/2;
tube_thickness = 2.5;

flange_depth = 3;
flange_width = 5;
overlay_depth = 10;

fit_tolerance = 0.5;

wide_flange(hole_radius=hole_radius,
	wall_depth=total_wall_depth/2,
	thickness=tube_thickness,
	flange_depth=flange_depth,
	flange_width=flange_width,
	overlay_depth=overlay_depth,
	fit_tolerance=fit_tolerance);

translate([60, 0, 0]) narrow_flange(hole_radius=hole_radius,
	wall_depth=total_wall_depth/2,
	thickness=tube_thickness,
	flange_depth=flange_depth,
	flange_width=flange_width,
	overlay_depth=overlay_depth,
	fit_tolerance=fit_tolerance);