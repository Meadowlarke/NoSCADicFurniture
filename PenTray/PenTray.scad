width=50;
length=200;
depth=40;
tabDepth=15;
tabDifference=tabDepth/3;

module base() {
    square([width,length]);
}

module longSide() {
    square([depth,length]);
}
    
module shortSide(){
    square([width,depth]);
}

module halfTab(){
        
            difference(){
    square([tabDepth,depth/2]);
    polygon(points = [[tabDepth,0], [0,tabDifference], [-1,-1]]);}
     }
   
module tab(){
 
    halfTab();
    translate([0,depth,0])
    mirror([0,1,0])
    halfTab();
    
}

module web(){
   
   translate([0,depth,0])
   longSide(); 
    
   translate([depth,depth,0])
   base(); 
    
   translate([depth+width,depth,0])
   longSide(); 
    
   translate([depth,0,0]) 
   shortSide(); 
   
   translate([depth,length+depth,0]) 
   shortSide();    
    
   translate([depth,depth-tabDepth,0])
   rotate([0,0,90]) 
   tab(); 
    
   translate([depth*2+width,depth-tabDepth,0])
   rotate([0,0,90]) 
   tab();    
   
   translate([0,tabDepth+depth+length,0])
   rotate([0,0,-90])
   tab();
   
   translate([depth+width,tabDepth+depth+length,0])
   rotate([0,0,-90])
   tab();   
 
}    



web();