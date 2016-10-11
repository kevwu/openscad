baseThickness = 5;


module truckMount() {
	width = 56;
	length = 78;

	// separation between screwholes
	cylWidth = 41;
	cylLength = 54;

	difference() {
		cube([width, length, baseThickness]);
		translate([(width - cylWidth)/2, (length - cylLength)/2, 0]) {
			cylinder(h=baseThickness, r=2.38, center=false, $fn=30);
			translate([cylWidth, 0, 0]) {
				cylinder(h=baseThickness, r=2.38, center=false, $fn=30);
			}
			translate([0, cylLength, 0]) {
				cylinder(h=baseThickness, r=2.38, center=false, $fn=30);
			}
			translate([cylWidth, cylLength, 0]) {
				cylinder(h=baseThickness, r=2.38, center=false, $fn=30);
			}
		}
	}
}



module triangle(o_len, a_len, depth)
{
	linear_extrude(height=depth)
	{
		polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
	}
}

module bumper() {
	length = 70;
	width = 56;
	
	translate([width,0,baseThickness]) {	
		mirror([0,1,0]) {
			rotate([0, -90, 0]) {
				triangle(length, 5, width);
			}
		}
	}

	translate([0,-length,0]) {
		cube([width, length, baseThickness]);
	}
}

truckMount();
bumper();