// 3d mockup to make sure that all the parts fit together. I still need to add the screw holes. 

include <../Round-Anything/polyround.scad>

$fn=360; // This makes round edges acutually round.  

sidex = 300; // Board side
sidey = 200; // Wall side
width = 25;
allowance = 1; // Bend allowance for thickness of steel, check table. For 1/8 mild steel bend allowance

screwHead = 13;
screwShaft = 10;

thickness = 5;

module strapx(){
    
    linear_extrude(thickness){
    square([width,sidex-width/2]);
    
    translate([width/2,sidex-width/2,0]){
    circle(d = width);
    }
}
}



module strapy(){
    rotate([90,0,0]){
        
       linear_extrude(thickness){ 
           
    square([width,sidey-width/2]);
    
    translate([width/2,sidey-width/2,0]){
    circle(d = width);
    }
    
}
}
}





strapx();
strapy();


module bridge() {
    bridgeW = 30;

overlap = 5; // How much of the bridge is "ground down" to give surface for welding

sidexB = sidex-screwShaft*2-width/4-bridgeW/2; // Shortened value of x to more easily draw the bridge length
sideyB = sidey-screwShaft*2-width/4-bridgeW/2; // Same idea

module outer(){

translate([sidexB,sideyB,0]){
scale([sidexB,sideyB,1]){
circle(r = 1);
}
}

}


module inner(){
    
    
 translate([sidexB,sideyB,0]){
scale([sidexB-bridgeW,sideyB-bridgeW,1]){
circle(r = 1);
}
}   
    }

module ring(){
translate([-overlap,-overlap,0]){
difference(){
outer();
inner();
}
}
}


// Primary part of the bridge    

    intersection(){
        square([sidexB,sideyB]);
        ring();
        
        }    

// Ball on z-axis

intersection(){
square([sidex,sidey]);
translate([bridgeW/2-overlap,sideyB,0]){
circle(d = bridgeW);
}
}

// Ball on x-axis

intersection(){
square([sidex,sidey]);
translate([sidexB,bridgeW/2-overlap,0]){
circle(d = bridgeW);
}
}
    
    }
    
    
    translate([width/2-thickness/2,0,0]){
    rotate([90,0,90]){
        linear_extrude(thickness){
    bridge();}
        
        
        }}

