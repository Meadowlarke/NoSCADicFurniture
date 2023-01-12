include <../Round-Anything/polyround.scad>

$fa = 1;
$fs = .01;

// ↑ This makes small holes actually round, not hexagons ↑


// ↓ Set length equal to length of foot. Adjust width, toe length, and heel length as needed. ↓

width=61;
length=310;

tabW=18;
tab4W=20;
tabL=73;
tabSpacing=20;
tab4Spacing=25;
tabRounding=3;
tabCrotchRounding=20;
tab2angle=5;
tab3angle=10;
tab4angle=20;
tab4Conicity=1.2;
tab4RightCrotchOffset=10;

toeL=56;
toeW=18;
toeRake=3;
toeOverhang=20;

heelCurve=20;
heelOverhang=toeOverhang/2;
heelScoop=2;
heelLength=90;
heelCurveRounding=30;
heelScoopRounding=1000;

pointRounding=1;

holeD=1;
ribbonHoleD=6;


seamTabW=10;

module half(){


points=[[0,0,50], 

//toe peak

[0, width/2,0], 
[toeRake,width+toeOverhang,pointRounding], 
[toeRake+toeL/2, width+toeOverhang/4,100],
[toeL,width,5],

// First tab

[toeL, tabL+width, tabRounding],
[toeL+tabW, tabL+width,tabRounding],
[toeL+tabW, width, tabCrotchRounding],

// Second tab

[toeL+tabW+tabSpacing,width,tabCrotchRounding],
[toeL+tabW+tabSpacing-(tabL*sin(tab2angle)),width+2*tabL-(tabL/cos(tab2angle)),tabRounding],
[toeL+2*tabW+tabSpacing-(tabL*sin(tab2angle)),width+2*tabL-(tabL/cos(tab2angle)),tabRounding],
[toeL+2*tabW+tabSpacing, width,tabCrotchRounding],


// Third tab

[toeL+2*tabW+2*tabSpacing, width, tabCrotchRounding],
[toeL+2*tabW+2*tabSpacing-tabL*sin(tab3angle),width+2*tabL-tabL/cos(tab3angle),tabRounding],
[toeL+3*tabW+2*tabSpacing-tabL*sin(tab3angle),width+2*tabL-tabL/cos(tab3angle), tabRounding],
[toeL+3*tabW+2*tabSpacing, width, tabCrotchRounding],


// 4th (heel) tab

[toeL+3*tabW+2*tabSpacing+tab4Spacing, width, tabCrotchRounding],
[toeL+3*tabW+2*tabSpacing+tab4Spacing-tabL*sin(tab4angle),width+2*tabL-tabL/cos(tab4angle), tabRounding],
[toeL+3*tabW+2*tabSpacing+tab4Spacing+tab4W-tabL*sin(tab4angle), width+2*tabL-tabL/cos(tab4angle),tabRounding],
[toeL+3*tabW+2*tabSpacing+tab4Spacing+tab4W*tab4Conicity, width, tabCrotchRounding*5],


// Heel peak

[length-heelLength,width-heelScoop, 0],
[length-heelLength*.8,width-heelScoop*2,heelScoopRounding],
[length-heelLength*.6,width-heelScoop*1.5,100],
[length-heelLength*.5,width-heelScoop*1.25,0],
[length-heelLength*.25,width-heelScoop,heelScoopRounding],
[length,width+heelOverhang,pointRounding], // top right corner 

// Heel bottom

[length,width/2,2*heelCurveRounding],
[length-heelCurve,0,heelCurveRounding]]

;

polygon(polyRound(points, 10));
}


// Cutting holes in heel for ribbon

module halfSlot(){
    difference(){
    half();
        
        translate([length-heelLength*.6,width*.87,0]){
        circle(d=ribbonHoleD);}
        
        translate([length-heelLength*.7,width*.87,0]){
        circle(d=ribbonHoleD);}
        
        }
    }



// Hole module for sewing

module hole(){
    circle(d = holeD);
}

// Punching sewing holes
module halfH() {
difference(){
halfSlot();
    
     translate([holeD*1/2+toeRake,width+toeOverhang-2*holeD, 0]){hole();}
    
     translate([holeD+toeRake*13/16,width+toeOverhang*45/60, 0]){hole();}
    
    translate([holeD+toeRake*12/16,width+toeOverhang*35/60, 0]){hole();}
    
    translate([holeD+toeRake*21/32,width+toeOverhang*12/30, 0]){hole();}
    
    translate([holeD+toeRake*9/16,width+toeOverhang*3/15, 0]){hole();}
    
    // Holes on main body
    
    
    translate([holeD+toeRake*8/16,width*16/16, 0]){hole();}
    
    translate([holeD+toeRake*7/16,width*15/16, 0]){hole();}
    
    translate([holeD+toeRake*6/16,width*14/16, 0]){hole();}
    
    translate([holeD+toeRake*5/16 ,width*13/16, 0]){hole();}
    
    translate([holeD+toeRake*4/16,width*12/16, 0]){hole();}

    translate([holeD+toeRake*3/16,width*11/16, 0]){hole();}
    
    translate([holeD+toeRake*2/16,width*10/16, 0]){hole();}
    
    translate([holeD+toeRake*1/16,width*9/16, 0]){hole();}
    
    translate([holeD,width*8/16,0]){hole();}

    // Holes on bottom curve
   
    translate([holeD+toeL*1/128,width*7/16,0]){hole();}
    
    translate([holeD+toeL*2/128,width*6/16,0]){hole();}

    translate([holeD+toeL*6/128,width*5/16,0]){hole();}

    translate([holeD+toeL*11/128,width*4/16,0]){hole();}

    translate([holeD+toeL*18/128,width*3/16,0]){hole();}

    translate([toeL*30/128,width*2/16,0]){hole();}

    translate([toeL*40/128,holeD+width*2/32,0]){hole();}

    translate([toeL*50/128,holeD+width*1/32,0]){hole();}

    translate([toeL*60/128,holeD*2,0]){hole();}
  
    // Heel
    
    translate([length-heelCurve*25/16,width*4/128,]){hole();}
    
    translate([length-heelCurve*44/32,width*6/128,]){hole();}
    
    translate([length-heelCurve*38/32,width*8/128,]){hole();}
    
    translate([length-heelCurve*32/32,width*12/128,]){hole();}
    
    translate([length-heelCurve*26/32,width*18/128,]){hole();}
    
    translate([length-heelCurve*20/32,width*28/128,]){hole();}
    
    translate([length-heelCurve*15/32,width*38/128,]){hole();}
    
    
    translate([length-heelCurve*10/32-holeD,width*48/128,]){hole();}
    
    translate([length-heelCurve*7/32-holeD,width*58/128,]){hole();}
    
    translate([length-heelCurve*5/32-holeD,width*68/128,]){hole();}
    
    translate([length-heelCurve*3/32-holeD,width*78/128,]){hole();}
    
    translate([length-heelCurve*2/32-holeD,width*90/128,]){hole();}
    
    translate([length-heelCurve*1/32-holeD,width*102/128,]){hole();}
    
    translate([length-heelCurve*1/64-holeD,width*114/128,]){hole();}   
    
    translate([length-heelCurve*0/32-holeD,width*128/128,0]){hole();}
    
    translate([length-heelCurve*0/32-holeD,width+heelOverhang*1/2,0]){hole();}
    
    translate([length-heelCurve*0/32-holeD,width+heelOverhang-2*holeD,0]){hole();}
    
    
    
    
}
}


// Making seam tabs


// Toe seam tab (bottom)

translate([length-heelCurve-heelLength-sin(tab4angle)*tabL,0,0]){
square([2*toeL,seamTabW]);}

// Heel seam tab (top)

translate([length-heelLength-heelCurve-sin(tab4angle)*tabL,width*2+tabL*2-seamTabW,0]){
square([2*heelCurve+width,seamTabW]);}


module noMachine(){
    translate([0, width+tabL,0]){
halfH();
mirror([0,1,0]){
   halfH();}
   }}
   
module yesMachine(){
    translate([0,width+tabL,0]){
    halfSlot();
    mirror([0,1,0]){
        halfSlot();}
    }}

// IMPORTANT: 

// If you have a sewing machine that can do leather, uncomment the following module, "yesMachine."
  
   //yesMachine();
   
    //Otherwise, uncomment  //noMachine
   
   noMachine();
   
 