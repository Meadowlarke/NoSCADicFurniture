// Shlef bracket bridge

$fn=360; // This makes round edges acutually round. 
$fa = 1;
$fs = 0.01;

// ↑ This makes small holes actually round, not hexagons ↑

sidex = 200; // Board side
sidey = sidex; // Wall side must be the same as board side for moon to look right.
width = 25;
allowance = 1; // Bend allowance for thickness of steel, check table. For 1/8 mild steel bend allowance is...

screwHead = 13;
screwShaft = 10;

bridgeW = 30;

sidexB = sidex-screwShaft*2-width/4; // Shortened value of x to more easily draw the bridge length
sideyB = sidey-screwShaft*2-width/4; // Same idea

module outer(){

translate([sidexB,sideyB,0]){
scale([sidexB,sideyB,1]){
circle(r = 1);
}
}

}


module inner(){
    
    
 translate([sidex,sidey,0]){
scale([sidex-bridgeW,sidey-bridgeW,1]){
circle(r = 1);
}
}   
    }

module ring(){
translate([0,0,0]){
difference(){
outer();
inner();
}
}
}

module bridge(){
    
    intersection(){
        square([sidexB,sideyB/4]);
        ring();
        
        }    
}

//bridge();

ring();