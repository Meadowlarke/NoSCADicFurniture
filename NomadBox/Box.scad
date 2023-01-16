// Global

plywoodThickness=5.3;

overhang=25.4; 
handleDepth=25.4;
handleX=108; // Including the radiused ends.
handleY=38.1;

// Side A, the WIDE side.

width=320; // Internal measurement. Currently set to UHual small box internal sizes
widthE=width+overhang*2; // External width
height = 304.8;
tabWidth=width/2;

fudge=1; // Fudge factor for slots (added to the slots.)

// Side B, the LONG side. 

length=415; // Internal measurement Currently set to UHual small box internal sizes
lengthE = length + overhang*2; // External measurment
tabLength=length/2;

// Bottom of box

undercut = .9; // Percent of plywood thickness that tabs are inset after assembly. Nomadic Furniture places it at 1/2--3/4 plywood thickness.


// Begin CAD


// A side, the WIDE side of the box.


module aHalf(){
   
    
difference(){
square([widthE/2, height]);

// Cutting out rectangular part of handle

translate([0, height -handleDepth- handleY, 0]){
square([handleX/2, handleY]);
}

// Radius for end of handle

translate([handleX/2, height-handleDepth-handleY/2, 0]){
circle(handleY/2);
}

// Vertical slots

translate([widthE/2 - overhang-fudge/2, height/2, 0]){

square([plywoodThickness+fudge, height/2+0.01]);
}

// Tab slot

translate([-0.01, overhang-fudge/2, 0]){
square([tabWidth/2+fudge, plywoodThickness+fudge]);
}

} // End difference block

}  // End define module half


module aHalfRound(){
    
    difference(){
    aHalf();
        translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,height-(overhang-plywoodThickness-fudge)+(overhang-plywoodThickness-fudge)/2+.01,0])
    square((overhang-plywoodThickness-fudge)/2);
        
      translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,0 ,0])
    square((overhang-plywoodThickness-fudge)/2+1); 
    }
    
    translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,height-(overhang-plywoodThickness-fudge)+(overhang-plywoodThickness-fudge)/2+.01,0])
    circle(d=(overhang-plywoodThickness-fudge));
    
    translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,(overhang-plywoodThickness-fudge)/2 ,0])
    circle(d=(overhang-plywoodThickness-fudge));
}






module A1(){



aHalfRound(); // If you want sqare edges, change this the indentical module bellow to "half();"

 mirror([1, 0, 0]){
  aHalfRound();
}
} // End define module A1



// 0-ing bottom left corner
module A(){

translate([widthE/2, 0, 0]){
    A1();
}
}


// B side, the LONG side of the box.

module bHalf(){
   
difference(){
square([lengthE/2, height]);

// Cutting out rectangular part of handle
translate([0, height -handleDepth- handleY, 0]){
square([handleX/2, handleY]);
}

// Radius for end of handle

translate([handleX/2, height-handleDepth-handleY/2, 0]){
circle(handleY/2);
}

// Vertical Slots

translate([lengthE/2 - overhang-fudge/2, 0, 0]){

square([plywoodThickness+fudge, height/2]);
}

// Tab slot

translate([0, overhang-fudge/2, 0]){
square([tabLength/2+fudge, plywoodThickness+fudge]);
    // See line 41
}

} // End difference block
} // End defining module half

module bHalfRound(){
    
    difference(){
    bHalf();
        translate([length/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,height-(overhang-plywoodThickness-fudge)+(overhang-plywoodThickness-fudge)/2+.01,0])
    square((overhang-plywoodThickness-fudge)/2);
        
      translate([length/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,0 ,0])
    square((overhang-plywoodThickness-fudge)/2); 
    }
    
    translate([length/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,height-(overhang-plywoodThickness-fudge)+(overhang-plywoodThickness-fudge)/2+.01,0])
    circle(d=(overhang-plywoodThickness-fudge));
    
    translate([length/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,(overhang-plywoodThickness-fudge)/2 ,0])
    circle(d=(overhang-plywoodThickness-fudge));
}


module B1() {


bHalfRound(); // If you want sqare edges, change this the indentical module bellow to "half();"

 mirror([1, 0, 0]){
  bHalfRound();
}
} // End defining module B1



// 0-ing bottom left corner

module B(){
translate([lengthE/2, 0, 0]){
B1();
}
}


// The bottom of the box

module quarter(){
square([width/2-fudge/2, length/2-fudge/2]);
// Side tab
translate([width/2-fudge, 0, 0]){
square([plywoodThickness*undercut+fudge, tabLength/2]);
}
// Top tab
translate([0, length/2-fudge, 0]){
square([tabWidth/2, plywoodThickness*undercut+fudge]);
}
}


module cHalf(){
quarter();
mirror([1, 0, 0]){
    quarter();
    }
}

module C(){
translate([width/2+plywoodThickness*undercut, length/2+plywoodThickness*undercut]){

cHalf();

mirror([0, 1, 0]){
cHalf();
}
}
}

// 3D model

module box(){

// A sides

translate([0,0,overhang-plywoodThickness])
linear_extrude(plywoodThickness)
A();

translate([0,0,length+overhang])
linear_extrude(plywoodThickness)
A();

// B sides

translate([overhang-plywoodThickness,0,length+overhang*2])
rotate([0,90,0])
linear_extrude(plywoodThickness)
B();

translate([overhang + width ,0,length+overhang*2])
rotate([0,90,0])
linear_extrude(plywoodThickness)
B();

// C sides

rotate([90,0,0])
translate([overhang-plywoodThickness*undercut,overhang-plywoodThickness*undercut,-overhang-plywoodThickness])
linear_extrude(plywoodThickness)
C();
}

// 3D Rendering

box();

// 2D rednerings

//A();
//B();
//C();