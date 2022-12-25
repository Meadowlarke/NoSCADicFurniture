// Shlef bracket strap

$fn=360; // This makes round edges acutually round. 
$fa = 1;
$fs = 0.01;

// ↑ This makes small holes actually round, not hexagons ↑

sidex = 200; // Board side
sidey = 200; // Wall side
width = 25;
allowance = 1; // Bend allowance for thickness of steel, check table. For 1/8 mild steel bend allowance

screwHead = 13;
screwShaft = 10;



module strap() {

translate([0,width/2,0]){
square([width,sidex+sidey+allowance-width]);
    }


translate([width/2, width/2, 0]){
circle(d = width);
    }
    
translate([width/2,sidex+sidey+allowance-width/2,]){
    circle(d=width);
    }
    
}
    
    
    
  module dropHole(){
      
      hull() {
      circle(d = screwShaft);
      translate([0, -screwShaft,0]){
          circle(d=screwHead);
          }
      
      }}
      
      // Punching out the screw holes.
      
      difference() {
      strap();
          translate([width/2, screwShaft + width,0]){
       circle(d= screwShaft);}
       
          translate([width/2,sidex+sidey+allowance-screwShaft*1.5,0]){
              circle(d= screwShaft);
           }
       
           translate([width/2,sidey-screwShaft*1.5,0]){
               dropHole();}
            
            
                translate([width/2,sidey+allowance+screwShaft*1.5,0]){
                    rotate([180,0,0]){
                        dropHole();
                    }
                }     
      }