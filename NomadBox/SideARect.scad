// Side A, the WIDE side, in millimeters, currenlty set to UHal small box sizes

overhang=25.4; 
width=320; // Internal measurement
widthE=width+overhang*2; // External width
height = 304.8;
plywoodThickness=6.35;
tabWidthW=width/2;
handleDepth=25.4;
handleX=108; // Including the radiused ends.
handleY=38.1;

fudge=0.5; // Fudge factor for slots



module A1(){

module half(){
   
   
   
    
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

translate([widthE/2 - overhang, height/2, 0]){

square([plywoodThickness+fudge, height/2]);
}

// Tab slot

translate([0, overhang, 0]){
square([tabWidthW/2, plywoodThickness+fudge]);
}

} // End difference block
} // End define module half

half();

 mirror([1, 0, 0]){
  half();
}
} // End define module A1



// 0-ing bottom left corner
module A(){

translate([widthE/2, 0, 0]){
    A1();
}
}

// Printing object

A();