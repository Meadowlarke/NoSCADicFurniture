$fn=100;

hookWidth = 5;
hookLength = 30;
tHeight=5;
tWidth = 10;


hull(){
translate([tHeight/2,tHeight/2,0])
circle(d=tHeight);

translate([tWidth-tHeight/2,tHeight/2,0])
circle(d=tHeight);
}

translate([tWidth/2-hookWidth/2,tHeight,0])
square([hookWidth,hookLength-hookWidth*1/2]);

translate([tWidth/2,hookLength+tHeight-hookWidth*1/2,0])
circle(d=hookWidth);