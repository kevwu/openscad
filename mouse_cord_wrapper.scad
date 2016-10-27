outer_dia = 30;
cable_dia = 3;
inner_dia = outer_dia - (4.5 * cable_dia);

// height of inner wrapper
height = 30;
// height of bases
base_height = 1.5;

fn = 250;

translate([0, 0, base_height])
	cylinder(h = height, d = inner_dia, $fn = fn);

cylinder(h = base_height, d = outer_dia, $fn = fn);

translate([inner_dia/2 + 2, 0, 3.75]) {
	rotate([90,0,0]) {
		difference() {
			cylinder(d = cable_dia * 2, h = base_height, $fn = fn);

			cylinder(h = base_height, d = cable_dia + 1, $fn = fn);
			cube([cable_dia, cable_dia, base_height]);
		}
	}
}

translate([inner_dia/2 + 2, 0, height - 0.75]) {
	rotate([90,90,0]) {
		difference() {
			cylinder(d = cable_dia * 2, h = base_height, $fn = fn);

			cylinder(h = base_height, d = cable_dia + 1, $fn = fn);
			cube([cable_dia, cable_dia, base_height]);
		}
	}
}

translate([0, 0, base_height + height])
	cylinder(h = base_height, d = outer_dia, $fn = fn);
