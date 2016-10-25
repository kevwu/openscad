height= 23;
radius = height / 2;
// full width of part
width= 55;

thickness = 20;
fragments = 300;

// flanges
flangeLength = 15;
translate([radius-4, radius, 0]) {
	cube([4, flangeLength, thickness]);
}
translate([width - radius - 4, radius, 0]) {
	cube([4, flangeLength, thickness]);
}

// power cord clip
cordDia = 6.23;
translate([width - radius, -height/2 - 7, 0]) {
	translate([-(cordDia+2)/2, cordDia/2, 0]) {
		cube([cordDia + 2, 2, thickness / 2]);
	}
	difference() {
		union() {
			translate([-(cordDia+2)/2, cordDia/2 - 5, 0]) {
				cube([cordDia + 2, 5, thickness / 2]);
			}
			cylinder(thickness / 2, d=cordDia + 3, center=false, $fn = fragments);
		}
		cylinder(thickness / 2, d=cordDia, center = false, $fn = fragments);

		translate([-2, -cordDia/2 - 2, 0]) {
			cube([4, 4, thickness / 2]);
		}
	}
}


// ring
difference() {
	hull() {
		translate([width - radius, 0, 0]) {
			cylinder(thickness, r=radius+3, center=false, $fn = fragments);
		}

		translate([radius, 0, 0]) {
			cylinder(thickness, r=radius+3, center=false, $fn = fragments);
		}
	}
	hull() {
		translate([width - radius, 0, 0]) {
			cylinder(thickness, r=radius, center=false, $fn = fragments);
		}

		translate([radius, 0, 0]) {
			cylinder(thickness, r=radius, center=false, $fn = fragments);
		}
	}

	// name
	translate([width/2 - 16, -height/2 - 2, thickness/2 - 5.5]) {
		rotate([90, 0, 0]) {
			linear_extrude(height=2) {
				text("Kevin Wu", size=4.5, $fn = fragments);
			}
		}
	}
}
