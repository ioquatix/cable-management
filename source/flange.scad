module wide_flange(hole_radius, wall_depth, thickness, flange_depth, flange_width, overlay_depth, fit_tolerance) {
	difference() {
		base_flange(hole_radius=hole_radius, wall_depth=wall_depth - fit_tolerance/2, thickness=thickness, flange_depth=flange_depth, flange_width=flange_width);
		translate([0, 0, wall_depth + 1 - overlay_depth - fit_tolerance]) cylinder(r=hole_radius - thickness / 2 + fit_tolerance /2, h=overlay_depth + 1);
	}
}

module narrow_flange(hole_radius, wall_depth, thickness, flange_depth, flange_width, overlay_depth, fit_tolerance) {
	union() {
		base_flange(hole_radius=hole_radius, wall_depth=wall_depth - fit_tolerance/2, thickness=thickness, flange_depth=flange_depth, flange_width=flange_width);
		translate([0, 0, wall_depth - fit_tolerance]) difference() {
			cylinder(r=hole_radius - thickness / 2 - fit_tolerance/2, h=overlay_depth - fit_tolerance);
			translate([0, 0, -1]) cylinder(r=hole_radius - thickness, h=overlay_depth + 2 + fit_tolerance);
		}
	}
}

module base_flange(hole_radius, wall_depth, thickness, flange_depth, flange_width) {
	difference() {
		union() {
			cylinder(r=hole_radius, h=wall_depth);
			/* the z=0 plane is the surface of the wall */
			translate([0, 0, - flange_depth]) cylinder(r=hole_radius + flange_width, h=flange_depth);
		}
		translate([0, 0, -(flange_depth + 1)]) cylinder(r=hole_radius - thickness, h=wall_depth + flange_depth + 2);
	}
}