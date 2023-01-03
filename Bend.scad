// This is a general purpose bend module

// First, input the variables that we will use:

r = 2; // Inside radius
w = 10; // Width of piece of metal to be bent
b = 1; // Bend allowance for your piece of metal
a = 90; // Bend angle
t = 4; // Thickness of the metal
$fn= 1000; // This tells the compiler the maximum number of faces of a surface.



module bend(){
    
    rotate_extrude(angle = a, convexity = 2)
    translate([r,0,0])
    square([t,w]);
    
}



// In 2D models, shorten what ever piece is being bent by the bend radius. When you bend it on a brake or with a jig, it will stretch to size desired.


// For 3D models, the wings on each side of the bend need to be shortened by a certain amount, but then translated outward by that same amount so that they marry with the bend module. For 90 degree bends, that amount is sqrt(r^2/2). Bend allowance is a negative linear quanitity in flat parts before they are bent. When you are drawing in 3D, you have to calculate how much space the bend will take up and factor that in the parts around it. 

bend();