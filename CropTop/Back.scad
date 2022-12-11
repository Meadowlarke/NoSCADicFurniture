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
slitWidth=1;

hem=30;
seamAllowance=20;


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

center = chest/2+bustAllowance/2+seamAllowance;

module slit(){
    points = 
[
 [center-slitWidth/2,length+hem+seamAllowance-neckScoop*.7,0],
 [center,length*3/4,0],
 [center+slitWidth/2,length+hem+seamAllowance-neckScoop*.7,0]       
];
   
    polygon(polyRound(points, 100));
    
}


difference(){

    whole();
    slit();
}
