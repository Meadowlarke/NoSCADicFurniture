// Box Bottom, in millimeters
 
width=254;
plywoodThickness=6.35;
tabWidth=width/2;
undercut=0.75; // How far tabs are inset after assemly. Nomadic Furniture places it at 1/2--3/4 plywood thickness


module C1(){
module quarter(){
square([width/2, width/2]);
translate([width/2, 0, 0]){
square([plywoodThickness*undercut, tabWidth/2]);
}
translate([0, width/2, 0]){
square([tabWidth/2, plywoodThickness*undercut]);
}
}


quarter();

mirror([1, 0, 0]){
   quarter();
}

mirror([0, 1, 0]){
    quarter();
}

mirror([1, 1, 0]){
    quarter();
}
}


// 0-ing bottom left corner

module C(){
translate([width/2 + plywoodThickness*0.75, width/2 + plywoodThickness*0.75, 0]){
C1();
}
}

// Printing object

C();