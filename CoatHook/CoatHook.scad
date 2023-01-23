// Coat hook

// To use this script, customize the values and render the 3D model to make sure it all looks good. Then render the flatpack and cut that out of steel using your CNC machine.

$fn=360; // This makes round edges acutually round. 

X = 25; // Top width
y = 50; // Length of part
x = 5; // Bottom width

s = 5.9; // Screw shaft size (diameter)

h = 20; // height of bend (length of hook)

a = 220; // angle of bend

t = 5; // Metal thickness, for 3D mockup.

module body(){

hull(){

translate([X/2,X/2+y,0]){
circle(d = X);
    }
    
translate([X/2,x/2,0]){    
circle(d = x);
}
}
}

module bodyHole(){

difference(){
body();
    
    translate([X/2,y+X/2,0]){
circle(d=s);    
    }
}
}


module topHalf(){
difference() {
bodyHole();
square([X,h]);
}
}

module bottomHalf(){
 difference() {
     bodyHole();
     translate([0,h,0]){
     square([X,x+y+X-h]);
     }
     }
}


module flatPack(){
    topHalf();
    bottomHalf();
    }



module TD() {

translate([0,-h,0]){

linear_extrude(t){

topHalf();
}
    
translate([0,h-h*cos(360-a),h*sin(360-a)]){
rotate([a,0,0]){

translate([0,-t/2,-t]){
linear_extrude(t){    
bottomHalf();
}
}

}
}
}
}

// Flatpack

flatPack();

translate([X*1.68,y*1.5,0])
rotate([0,0,180])
flatPack();

// 3D model

//TD();