
use <bolts.scad>;

height = 80;
width = 10;
thickness = 10;

module screw_mount() {
	difference() {
		union() {
			hull() {
				translate([4, 1.5, 0]) cube([2, thickness-3, width]);
				translate([6, 1, 0]) cube([1.5, thickness-2, width]);
			}
			
			translate([thickness-4, 1.5, 0]) cube([4, thickness-3, width]);
			
			translate([10, 0, 0]) cube([2, 10, width]);
		}
		
		translate([16, thickness/2, thickness/2]) rotate(90, [0, -1, 0]) countersunk_hole(depth=8);
	}
}

translate([10, 20, 0]) cube([2, height-30, width]);
translate([0, 10, 0]) screw_mount();
translate([0, height-10, 0]) screw_mount();
