// Side B, the LONG side, in millimeters. Currently set to UHual small box internal sizes

overhang=25.4;
height = 304.8;
width=254; // Internal measurement
length=415; // Internal measurement
lengthE = length + overhang*2; // External measurment
plywoodThickness=5.2;
tabWidthL=length/2;
handleDepth=25.4;
handleX=108; // Including the radiused ends.
handleY=38.1;
fudge=1; // Fudge factor for slots



module half(){
   
   
   
    
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

translate([lengthE/2 - overhang, 0, 0]){

square([plywoodThickness+fudge, height/2]);
    
    // Fudge is applied to outside edge here. Is that okay? Should it be applied to each side evenly?
}

// Tab slot

translate([0, overhang, 0]){
square([tabWidthL/2+fudge, plywoodThickness+fudge]);
    // See line 41
}

} // End difference block
} // End defining module half

module halfRound(){
    
    difference(){
    half();
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


halfRound(); // If you want sqare edges, change this the indentical module bellow to "half();"

 mirror([1, 0, 0]){
  halfRound();
}
} // End defining module B1



// 0-ing bottom left corner

module B(){
translate([lengthE/2, 0, 0]){
B1();
}
}


// Printing objectt
B();

