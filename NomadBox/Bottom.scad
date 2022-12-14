// Box Bottom, in millimeters, currently set to UHaul small box internal sizes
 
width=320; // Internal measurement
length=415; // Internal measurment
plywoodThickness=5.2;
tabWidthW=width/2;
tabWidthL=length/2;
undercut=0.9; // How far tabs are inset after assemly. Nomadic Furniture places it at 1/2--3/4 plywood thickness

module quarter(){
square([width/2, length/2]);
// Side tab
translate([width/2, 0, 0]){
square([plywoodThickness*undercut, tabWidthL/2]);
}
// Top tab
translate([0, length/2, 0]){
square([tabWidthW/2, plywoodThickness*undercut]);
}
}


module half(){
quarter();
mirror([1, 0, 0]){
    quarter();
    }
}

module C(){
translate([width/2+plywoodThickness*undercut, length/2+plywoodThickness*undercut]){

half();

mirror([0, 1, 0]){
half();
}
}
}

C();

