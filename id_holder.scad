/*
Holds SD cards next to ID cards.
Designed for the Longhorn Maker Studio.
*/

width = 100;
length = 6;
height = 15;

slotDepth = 17;

module slot(slotno=0)
{   
	translate([0,(slotno * length),0]){
		difference(){
			cube([width,length,height]);
			// sd card slot
			translate([10, 1, 5]){
				cube([25,3,slotDepth]);
			}
			// ID slot
			translate([40, 1, 5]){
				cube([55,3,slotDepth]);
			}
			translate([1,1,height-1]) {
				linear_extrude(height = 1.5) {
					text(text = str(slotno), size = 4);
				}
			}

		}
	}
}

difference() {
	union(){
		for(i = [1 : 20]) {
			slot(i);
		}

		// add thickness before and after
		cube([width,length,height]);
		translate([0, (length)*21, 0]) {
			cube([width,length,height]);
		};
	};

	translate([1, 2, 2]) {
		rotate([90,0,0]) {
			linear_extrude(height=2) {
				text("Maker Studio");
			}
		}
	}
}