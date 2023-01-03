// 3d mockup to make sure that all the parts fit together. I still need to add the screw holes. 

include <../Round-Anything/polyround.scad>

$fn=360; // This makes round edges acutually round.  

sidex = 300; // Board side
sidey = sidex; // Wall side
width = 25;
allowance = 1; // Bend allowance for thickness of steel, check table. For 1/8 mild steel bend allowance

screwHead = 13;
screwShaft = 10;

thickness = 5;
    bridgeW = 30;

overlap = 1; // How much of the bridge is "ground down" to give surface for welding

sidexB = sidex*.7; // Shortened value of x to more easily draw the bridge length
sideyB = sidey*.7; // Same idea




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
        
        square([width,sidex-width/2-allowance/2]);
    
    translate([width/2,sidex-width/2-allowance/2,0]){
    circle(d = width);
    }        
        }
        
        // The holes
        
        translate([width/2, sidex - width/2-allowance/2,0]){
       circle(d= screwShaft);}
       
       translate([width/2,screwShaft/2+width/2-allowance/2,0]){
           
           rotate([180,0,0]){
       dropHole();}
           
           }
        
    }
}

module strapxtrude(){
    linear_extrude(thickness){
        
        
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

module strapy(){ 
             difference(){
           
           union(){
           
    square([width,sidey-width/2-allowance/2]);
    
    translate([width/2,sidey-width/2-allowance/2,0]){
    circle(d = width);
    }
}
    translate([width/2,sidey-width/2-allowance/2,0]){
    circle(d=screwShaft);
    }

    translate([width/2,screwShaft/2+width/2-allowance/2,0]){
        rotate([0,0,180]){
        dropHole();
        }
        
        }


}
    
}







module outer(){



circle(d = sidex);



}


module inner(){
    
    


circle(d = sidex);

   
    }

module moon(){
translate([sidex/2,sidex/2,0]){
difference(){
outer();
    translate([3/16*sidex,3/16*sidex,0]){
inner();
    }
}
}
}


   


  
    
    
    
    module bridge(){
    translate([width/2-thickness/2,-overlap,thickness-overlap]){
    rotate([90,0,90]){
        linear_extrude(thickness){
    moon();}
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
    translate([0,sidey-allowance/2,0]){
    strapx();
    }
    
    translate([width,sidey-allowance/2,0]){
    rotate([0,0,180]){
     strapy();
        }
    }
        
    
}


ThreeDModel();

//TwoDStrap();

//moon();