include <Round-Anything/polyround.scad>

// Set length equal to length of foot. Adjust width, toe length, and heel length as needed.

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

// Hole module for sewing

module hole(){
    circle(d = holeD);
}

// Punching sewing holes
module halfH() {
difference(){
half();
    translate([holeD+toeRake,width+toeOverhang-2*holeD,0]){hole();}
    translate([holeD+toeRake/2, width, 0]){hole();}
    translate([holeD,width/2,0]){
   hole();}

}
}


module noMachine(){
halfH();
mirror([0,1,0]){
   halfH();}
   }
   
module yesMachine(){
    half();
    mirror([0,1,0]){
        half();}
    }

// IMPORTANT: 

// If you have a sewing machine that can do leather, uncomment the following module, "yesMachine."
  
   //yesMachine();
   
    //Otherwise, uncomment  //noMachine
   
   noMachine();
   
   