include <../Round-Anything/polyround.scad>

bustAllowance=60;
chest=380;
underBust=180;
neckWidth=200;
length=410;
neckScoop=40;
bustScoop=30;
armScoop=90;
strapWidth=15;

turtleNeckHeight=80;

hem=30;
seamAllowance=20;


// Some math shit to calculate the length of the neck piece. Oh the things I do for you.
x1=-chest/2+neckWidth/2+seamAllowance;
y1=length+hem+seamAllowance;
y2=length-neckScoop*2+hem+seamAllowance;
x3=chest/2-neckWidth/2-seamAllowance;
y3=length+hem+seamAllowance;

b=(x1^2 + y1^2 - y2^2) / (2*(y1 + y2));

r= sqrt((y2-b)^2); 

angle=atan((y3-y2)/(x3));

arcLength=angle/360*r;

neckLength=8*arcLength;

// This seems to have worked, it looks like it is juuuuust perfectly long enough without any extra buffer. Wow that sure was a refresher in algebra, trig, and analytic geometry.

module half(){

points=
[
    // Bottom left corner
    [-chest/2-seamAllowance,0,0],
    // Bust scoop
    [-chest/2-bustAllowance/2+bustScoop-seamAllowance, underBust/2+hem,1000],
    // Bust peak
    [-chest/2-bustAllowance/2-seamAllowance,underBust+hem,0],
    // Arm scoop
    [(-chest/2-neckWidth/2)/2+armScoop-seamAllowance, underBust+(length-underBust)/3+hem,1000],
    // Left neckhole peak
    [-chest/2+neckWidth/2-seamAllowance-strapWidth, length+hem+seamAllowance,0],
    [-chest/2+neckWidth/2+seamAllowance, length+hem+seamAllowance,0],
    // Bottom of neck scoop
    [0, length-neckScoop*2+hem+seamAllowance,200],
    // Right neckhole peak
    [chest/2-neckWidth/2-seamAllowance, length+hem+seamAllowance,0],
    [chest/2-neckWidth/2+seamAllowance+strapWidth, length+hem+seamAllowance,0],
    // Bottom center
    [0,0,0]
    
]
;

polygon(polyRound(points, 100));
}

module wholeCentered(){
half();
mirror([1,0,0]){half();}
}

module whole(){

translate([chest/2+bustAllowance/2+seamAllowance,0,0]){
wholeCentered();}
}

//Vwhole();

//half();


square([neckLength+seamAllowance*2,turtleNeckHeight*2+seamAllowance*2]);

// echo(neckLength+seamAllowance*2);
