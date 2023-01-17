
// This is combined document containing the 3D mockup and flat sheet metal files. 
 

include <../Round-Anything/polyround.scad>

$fn=360; // This makes round edges acutually round.  

sidex = 250; // Board side
sidey = 250*.75; // Wall side
width = 25;

thickness = 3.1;
bendRadius = 5; // This depends on your bending tool. For metals under ~6mm, the bend radius can be assumed to be the same as the metal thickness.

Kfactor = .44; // Look this up on a chart for you metal. This is the number for bottom bending mild steel of 0 to 1 metal thickness.

//allowance = 90*3.14/180*(bendRadius+Kfactor*thickness); // Bend allowance formula. Comment out and set to 0 to accurately preview 3D part. If you don't set it to 0 for the 3D preview, the preview will show how far *off* the piece will be if you do not account for K factor, but in the opposite direction

allowance = 0;

screwHead = 15;
screwShaft = 9;


bridgeW = 25;
    
tabWidth = 20;

tabDepthPercent=.8;

tabReverseDepth = 10; // This is how far the tabs go into the BRIDGE in order to be a smooth shape.

tabFudge=2;
tabFudgeLength=4;
    
overhangx = 5;

overhangy = 5;

overlap = 2; // How much of the bridge is "ground down" to give surface for welding

contactSize = sqrt(sidex^2-(sidex-overlap)^2);

echo("Contact pactch roughly equal to", contactSize);

sidexB = sidex-screwShaft*2-width/4-bridgeW/2-overhangx; // Shortened value of x to more easily draw the bridge length
sideyB = sidey-screwShaft*2-width/4-bridgeW/2-overhangy; // Same idea


  module dropHole(){
      
      hull() {
      circle(d = screwShaft);
      translate([0, -screwShaft*1.5,0]){
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
           
        // Groove
           
           translate([width/2-thickness/2-tabFudge/2,sidexB-tabWidth/2-tabFudgeLength/2-allowance/2-bridgeW/2,0])
           square([thickness+tabFudge,tabWidth+tabFudgeLength]);
        
    }
}

module strapxtrude(){
    linear_extrude(thickness){
        
        
       strapx();
}}




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

// Tab Groove

    translate([width/2-thickness/2-tabFudge/2,sideyB-tabWidth/2-tabFudgeLength/2-allowance/2-bridgeW/2,0])
    square([thickness+tabFudge,tabWidth+tabFudgeLength]);



}
    
}


module strapytrude(){
    
    rotate([90,0,0])
    linear_extrude(thickness)
  strapy();
}







module TwoDBridge() {


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
translate([thickness*tabDepthPercent,thickness*tabDepthPercent,0]){

    intersection(){
        square([sidexB,sideyB]);
        ring();}
        
         

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

//Tabs

translate([-thickness*tabDepthPercent,sideyB-tabWidth/2-bridgeW/2,0])
square([thickness*tabDepthPercent+tabReverseDepth,tabWidth]);

translate([sidexB-tabWidth/2-bridgeW/2,-thickness*tabDepthPercent,0])
square([tabWidth, thickness*tabDepthPercent+tabReverseDepth]);


    }}
    
    
    module bridge(){
    translate([width/2-thickness/2,0,thickness]){
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
    translate([0,0,thickness])
strapytrude();
translate([0,-thickness*tabDepthPercent,-thickness*tabDepthPercent])
    translate([0,0,0])
bridge();
bendFillet();
    }

}


module TwoDStrap(){
    
    difference(){
    
    union(){
    translate([0,sidey-allowance/2,0]){
    strapx();
    }
    
    translate([width,sidey-allowance/2,0]){
    rotate([0,0,180]){
     strapy();
        }
    }
}

//Bending perferations

for (i=[0:width:width])
translate([i,sidey-allowance/2,0])
circle(d=3);

    



  }  
}


//ThreeDModel(); //Remeber to set allowance to 0

TwoDStrap(); // Remeber to reset allowance FROM 0

//TwoDBridge(); // Same as above