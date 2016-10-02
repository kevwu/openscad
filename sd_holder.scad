//use("text");

width = 100;
length = 6;
height = 20;

slotDepth = 15;

module slot(slotno=0)
{   
    translate([0,(slotno * length),0]){
           translate([1,1,40]) {
                linear_extrude(height = 100) {
                    text(text = slotno, size = 20);
                }
            }
        
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
            

        }
    }
}

//slot();


for(i = [0 : 20]) {
    slot(i);
}
