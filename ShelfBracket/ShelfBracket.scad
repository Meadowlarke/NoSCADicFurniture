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



  module dropHole(){
      
      hull() {
      circle(d = screwShaft);
      translate([0, -screwShaft,0]){
          circle(d=screwHead);
          }
      
      }}


module strapx(){
    
        difference(){ // Making strap with screw holes
        
        union(){ // Body of the strap
        
        square([width,sidex-width/2]);
    
    translate([width/2,sidex-width/2,0]){
    circle(d = width);
    }        
        }
        
        // The holes
        
        translate([width/2, sidex - width/2,0]){
       circle(d= screwShaft);}
       
       translate([width/2,screwShaft/2+width/2,0]){
           
           rotate([180,0,0]){
       dropHole();}
           
           }
        
    }
}

module strapxtrude(){
    linear_extrude(thickness){
        strapx();
    } 
}



module strapytrude(){
    
    translate([0,0,thickness]){
    
    rotate([90,0,0]){
        
       linear_extrude(thickness){ 
           
         difference(){
           
           union(){
           
    square([width,sidey-width/2]);
    
    translate([width/2,sidey-width/2,0]){
    circle(d = width);
    }
}
    translate([width/2,sidey-width/2,0]){
    circle(d=screwShaft);
    }

    translate([width/2,screwShaft/2+width/2,0]){
        rotate([0,0,180]){
        dropHole();
        }
        
        }


}
    
}
}

}
}

module strapy(){ //This is a copy of strapytrude minus the extrusion... Less than ideal, but the only way that I can figure out how to get this to work.
             difference(){
           
           union(){
           
    square([width,sidey-width/2]);
    
    translate([width/2,sidey-width/2,0]){
    circle(d = width);
    }
}
    translate([width/2,sidey-width/2,0]){
    circle(d=screwShaft);
    }

    translate([width/2,screwShaft/2+width/2,0]){
        rotate([0,0,180]){
        dropHole();
        }
        
        }


}
    
}






module TwoDBridge() {
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
    
    
    module bridge(){
    translate([width/2-thickness/2,0,0]){
    rotate([90,0,90]){
        linear_extrude(thickness){
    TwoDBridge();}
        }}
    }


module bendFillet(){
    
    
    
    translate([0,0,thickness]){
    rotate([0,90,0]){
    radius = thickness;
angles = [270, 360];
points = [
    for(a = [angles[0]:1:angles[1]]) [radius * cos(a), radius * sin(a)]
];
    
    linear_extrude(width){
polygon(concat([[0, 0]], points));}
    
} 
    
}

}





module ThreeDModel(){
translate([0,thickness,0]){

strapxtrude();
strapytrude();
bridge();
bendFillet();}

}


module TwoDStrap(){
    translate([0,sidey+allowance,0]){
    strapx();
    }
    
    translate([width,sidey,0]){
    rotate([0,0,180]){
     strapy();
        }
    }
    
    // Little filler piece for bend allowance 
    translate([0,sidey,0]){
    square([width,allowance]);
    }
    
    
}


ThreeDModel();

//TwoDStrap();

//TwoDBridge();