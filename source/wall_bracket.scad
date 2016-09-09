
use <bolts.scad>;

height = 80;
width = 10;
thickness = 10;

module screw_mount() {
	render() difference() {
		cube([thickness, thickness, width]);
		translate([4, 1, 0]) cube([thickness-6, thickness-2, width]);
		translate([thickness-2, 1.5, 0]) cube([2, thickness-3, width]);
		
		translate([-2, thickness/2, thickness/2]) rotate(90, [0, 1, 0]) countersunk_hole();
	}
}

module cable_clip(cable_diameter = 6, thickness = 2) {
	radius = cable_diameter/2 + thickness;
	
	translate([radius, radius, 0]) difference() {
		union() {
			
			cylinder(h=width, r=radius, $fn=32);
			translate([-radius, -radius, 0]) cube([radius, radius*2, width]);
		}
		
		cylinder_outer(width, cable_diameter/2);
		
		rotate(-75, [0, 0, 1]) translate([-radius/2, 0, 0]) cube([radius, radius, width]);
	}
}

module led_clip(strip_width = 8) {
	difference() {
		cube([strip_width+2, 2, width]);
		
		translate([1, 1, 0]) cube([strip_width, 0.6, width]);
		translate([2, 0, 0]) cube([strip_width - 2, 1, width]);
	}
}

translate([0, 10, 0]) screw_mount();
translate([0, height-10, 0]) screw_mount();

for (i = [0:5]) {
	translate([0, 20+i*8, 0]) cable_clip();
}

translate([0, 8, 0]) led_clip();
