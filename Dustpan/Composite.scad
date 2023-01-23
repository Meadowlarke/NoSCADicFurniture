thickness=1;
width=300;
length=200;
depth=50;




module bottomPanel(){
square([width,length]);
}



module wing(){
  ;
    polygon(points=[[0,0],[depth,length],[depth,0]]);
}


module threeD(){

translate([thickness,0,0])
linear_extrude(thickness)
bottomPanel();


translate([0,0,depth+thickness])
rotate([0,90,0])
linear_extrude(thickness)
wing();

translate([width+thickness,0,depth+thickness])
rotate([0,90,0])
linear_extrude(thickness)
wing();}


module flatPack(){
    
    translate([depth,0,0])
    bottomPanel();
    wing();
    
    translate([width+depth*2,0,0])
   mirror([1,0,0])
    wing();
    
}


//flatPack();
threeD();