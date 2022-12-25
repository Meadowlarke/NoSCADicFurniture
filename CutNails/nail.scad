headW=10;
headL=5;
shaftW=8;
pointW=2;
length=60; 

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
 