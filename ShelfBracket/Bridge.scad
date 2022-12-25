// Shlef bracket bridge

$fn=360; // This makes round edges acutually round. 
$fa = 1;
$fs = 0.01;

// ↑ This makes small holes actually round, not hexagons ↑

sidex = 400; // Board side
sidey = 400; // Wall side
width = 25;
allowance = 1; // Bend allowance for thickness of steel, check table. For 1/8 mild steel bend allowance is...

screwHead = 13;
screwShaft = 10;

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
