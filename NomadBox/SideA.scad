// Side A, in millimeters
 
width=254;
height = 304.8;
plywoodThickness=6.35;
tabWidth=width/2;
handleDepth=25.4;
handleX=108; // Including the radiused ends.
handleY=38.1;
overhang=25.4;
fudge=0.5; // Fudge factor for slots



module A1(){

module half(){
   
   
// Cutting out rectangular part of handle   
    
difference(){
square([height/2, height]);
translate([0, height -handleDepth- handleY, 0]){
square([handleX/2, handleY]);
}

// Radius for end of handle

translate([handleX/2, height-handleDepth-handleY/2, 0]){
circle(handleY/2);
}

// Vertical slots

translate([height/2 - overhang, height/2, 0]){

square([plywoodThickness+fudge, height/2]);
}

// Tab slot

translate([0, overhang, 0]){
square([tabWidth/2, plywoodThickness+fudge]);
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

translate([height/2, 0, 0]){
    A1();
}
}

// Printing object

A();