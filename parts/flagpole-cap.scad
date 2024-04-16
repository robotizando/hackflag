
$fn = 32;

//Pipe Support Section
dIntClearance = 0.5;
dPipe = 16.4 ; // 16mm alunminum external diameter 
hCap = 10; //height of the pipe fit
wallCap = 2; // part wall
hTop = 2;    // top height


dIntPipe = dPipe + dIntClearance;
dExtCap = dIntPipe + (wallCap * 2);


translate([0,0,0])
    cap();



module cap(){
    difference(){
        cylinder(r=(dExtCap/2), h= hCap);
        
        translate([0,0,-1])
        cylinder(r=dIntPipe/2, h= hCap);
        
        *translate([0,0, -4 ])
        cylinder(r=1, h=20);
    }

    translate([0,0, hCap])
    difference(){
        scale([1, 1, 0.3])
        sphere(r=dExtCap/2);
        
        translate([-50,-50, -dExtCap/4 ])
        cube([100,100,dExtCap/4]);

    }
}

