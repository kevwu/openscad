module sdBlank(text="") {
	sdWidth = 24;
	sdLength = 32;
	sdDepth = 2;

	difference() {
		cube([sdWidth, sdLength, sdDepth]);

		translate([1,sdLength - 10,sdDepth - 1]) {
			linear_extrude(height=1) {
				text(text, size=3.5);
			}
		}
	}
}

module employeeBlank(text="") {
	sdWidth = 24;
	sdLength = 32;
	sdDepth = 2;

	difference() {
		cube([sdWidth, sdLength, sdDepth]);

		translate([1,sdLength - 10,sdDepth - 1.5]) {
			linear_extrude(height=1.5) {
				text(text, size=3.5);
			}
		}
	}
}

union(){
for(i = [1:4]) {
	translate([((i-1) * 30), 0, 0]) {
		sdBlank(str("Laptop ",i));
	}
}

for(i = [5:8]) {
	translate([((i-5) * 30), 40, 0]) {
		sdBlank(str("Laptop ",i));
	}
}
}

for(i = [1:3]) {
	translate([((i-1) * 30), 80, 0]) {
		sdBlank(str("Caliper ",i));
	}
}

!translate([3*30, 80, 0]) {
	sdBlank(str("90W Laser"));
}