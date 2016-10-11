pcbWidth = 15;
pcbLength = 34;

usbHeight = 5;
usbWidth = 13;

totalLength = 48;

side = 1;
baseThickness = 1;

// base
module base(riserHeight = 4) {
	cube([side + pcbWidth + side, side + pcbLength + side,baseThickness]);

	// riser
	translate([side, pcbLength - 6, baseThickness]) {
		cube([pcbWidth, 3, riserHeight]);
	}
}

// USB port border
module usbPort(length=5) {
	difference(){
		// size of USB port + border
		cube([side + usbWidth + side, length, side + usbHeight + side]);
		
		// minus USB port
		translate([side, 0, side]) {
			cube([usbWidth, length, usbHeight]);
		}
	}
}

translate([0,5,0]) {
	base();
}
translate([(pcbWidth - usbWidth)/2, 0, 0]) {
	usbPort();
}