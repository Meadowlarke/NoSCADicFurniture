// NOTE, IF YOU ARE CUTTING THIS OUT ON THE ARTISANS ASYLUM CNC PLASMA CUTTER, YOU WILL HAVE TO ENTER ALL THE VALUES IN INCHES, RATHER THAN MM!

headW=10; // Width of head
headL=5; // Length of head
shaftW=8; // Width of shaft at widest point
pointW=2; // Width of point
length=60; // Length of shaft

CNCKerf=1; // Kerf of machine. This may also need to be adjusted based on how well your machine can do corners, and whether they will need to be pocketed in order to get sharp points. 

NoNails= 10; // Numbner of nails you want to make

RR = (shaftW-pointW)/length; // This is the slope of the nail, used to calculate spacing.
 
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
  
   translate([(headW+ pointW + RR*headL + CNCKerf)*i,0,0]){

nail();

}}


module downNail(){  
     
     for (i=[0:NoNails/2])
  
   translate([(headW + pointW + RR*headL + CNCKerf)*i+(headW + pointW + RR*headL + CNCKerf)/2,length+headL,0]){

rotate([180,0,0]){
nail();}

}}
    
upNail();
downNail();
 