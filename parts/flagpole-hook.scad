
$fn = 64;


dIntClearance = 0.5;
dPipe = 16.4 ; // 16mm alunminum external diameter 
wallPipe = 4;

hPipe = 8;
hHookHole = 5;


wallHook = 2.5;
dHoleHook = 4;
dExtHookHole = 10;


dExtPipe = dPipe + (wallPipe*2);
dIntPipe = dPipe + dIntClearance;
dExtHook = dPipe + (wallHook * 2);


hook();

module hook(){

    difference(){

        translate([0,0,0]){
            difference(){
                minkowski(){
                    cylinder(r=(dExtHook/2)-1, h= hPipe);
                    sphere(r=1);
                }
                
                translate([0,0,-1])
                cylinder(r=dPipe/2, h= hPipe+2);
            }

            translate([hHookHole/2,dExtHook/2  + dExtHookHole / 4 -1.5, hPipe/2])
            rotate([0,-90,0])
            difference(){
                cylinder(r=(dExtHookHole/2), h= hHookHole);
                cylinder(r=dHoleHook/2, h= hHookHole+2);
                
                    rotate([0,-90,0])
                translate([dPipe/4-1,-10 ,-5])
                   cylinder(r=dIntPipe/2, h= hHookHole+5);
            }
        }
        
        translate([-50,-50, -50.5 ])
          cube([100,100,50]);
        
        translate([-50,-50,  hPipe + 0.75 ])
          cube([100,100,50]);
    }
}

