// NOTE, IF YOU ARE CUTTING THIS OUT ON THE ARTISANS ASYLUM CNC PLASMA CUTTER, YOU WILL HAVE TO ENTER ALL THE VALUES IN INCHES, RATHER THAN MM!

headW=10; // Width of head
headL=5; // Length of head
shaftW=8; // Width of shaft at widest point
pointW=2; // Width of point
length=60; // Length of shaft

CNCKerf=3; // Kerf of machine

NoNails= 10; // Numbner of nails you want to make
 
 module nail(){
 
 points=[
 [0,0],
 [0, headL],
 [headW/2-shaftW/2, headL],
 [headW/2 - pointW/2, length+headL],
 [headW/2 + pointW/2,length+headL],
 [headW/2 + shaftW/2 ,headL],
 [headW, headL],
 [headW, 0]
 ];
 
     polygon(points);
 }
 
 
 
 
 module upNail(){  
     
     for (i=[0:NoNails/2])
  
   translate([(headW+CNCKerf)*i,0,0]){

nail();

}}


module downNail(){  
     
     for (i=[0:NoNails/2])
  
   translate([headW/2+ CNCKerf/2+ (headW+CNCKerf)*i,length+headL,0]){

rotate([180,0,0]){
nail();}

}}
    
upNail();
downNail();
 