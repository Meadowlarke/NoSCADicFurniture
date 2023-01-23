thickness=1;
width=300;
length=200;
depth=50;

tabDepth=depth/5;




module bottomPanel(){
square([width,length]);
}



module wing(){
  ;
    polygon(points=[[0,0],[depth,length],[depth,0]]);
}


module back(){
    
square([width,depth]);    
     
}

module twoDBack(){
    
   square([width-thickness*2,depth]);   
}

module tab(){
    
    module halfTab(){
        
            difference(){
    square([tabDepth,depth/2]);
    polygon(points = [[tabDepth,0], [0,tabDepth], [-1,-1]]);}
     }
     
     halfTab();
    
     translate([0,depth,0])
    mirror([0,1,0]){
    difference(){
    square([tabDepth,depth/2]);
    polygon(points = [[tabDepth,0], [0,tabDepth], [-1,-1]]);}
}
}






module threeD(){

translate([thickness,thickness,0])
linear_extrude(thickness)
bottomPanel();


translate([0,thickness,depth+thickness])
rotate([0,90,0])
linear_extrude(thickness)
wing();

translate([width+thickness,thickness,depth+thickness])
rotate([0,90,0])
linear_extrude(thickness)
wing();
    
    translate([thickness,thickness,thickness])
    rotate([90,0,0])
    linear_extrude(thickness)
    back();
    
    }




module flatPack(){
    
    translate([depth,depth,0])
    bottomPanel();
    
    translate([0,depth,0])
    wing();
    
    translate([width+depth*2,depth,0])
   mirror([1,0,0])
    wing();
    
    translate([depth+thickness,0,0])
    twoDBack();
    
    translate([depth-tabDepth+thickness,0,0])
    tab();
   
    translate([depth+width+tabDepth-thickness,0,0])
    mirror([1,0,0])
    tab();
    
}


threeD();
//flatPack();