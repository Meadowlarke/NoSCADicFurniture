// Side A, the WIDE side, in millimeters, currenlty set to UHal small box sizes

overhang=25.4; 
width=320; // Internal measurement
widthE=width+overhang*2; // External width
height = 304.8;
plywoodThickness=5.2;
tabWidthW=width/2;
handleDepth=25.4;
handleX=108; // Including the radiused ends.
handleY=38.1;

fudge=1; // Fudge factor for slots (added to the slots.)


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

square([plywoodThickness+fudge, height/2+0.01]);
}

// Tab slot

translate([-0.01, overhang, 0]){
square([tabWidthW/2+fudge, plywoodThickness+fudge]);
}

} // End difference block

}  // End define module half


module halfRound(){
    
    difference(){
    half();
        translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,height-(overhang-plywoodThickness-fudge)+(overhang-plywoodThickness-fudge)/2+.01,0])
    square((overhang-plywoodThickness-fudge)/2);
        
      translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,0 ,0])
    square((overhang-plywoodThickness-fudge)/2); 
    }
    
    translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,height-(overhang-plywoodThickness-fudge)+(overhang-plywoodThickness-fudge)/2+.01,0])
    circle(d=(overhang-plywoodThickness-fudge));
    
    translate([width/2+plywoodThickness+fudge + (overhang-plywoodThickness-fudge)/2+.01 ,(overhang-plywoodThickness-fudge)/2 ,0])
    circle(d=(overhang-plywoodThickness-fudge));
}






module A1(){



halfRound(); // If you want sqare edges, change this the indentical module bellow to "half();"

 mirror([1, 0, 0]){
  halfRound();
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
