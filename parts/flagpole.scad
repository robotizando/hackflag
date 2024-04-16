



hPipe = 300;


import("flagpole-base.stl");

color("white")
cylinder(r=16/2, h=hPipe);

translate([0,0,hPipe-20])
import("flagpole-hook.stl");

translate([0,0,hPipe-160])
import("flagpole-hook.stl");

translate([0,0,hPipe])
import("flagpole-cap.stl");

color("gray")
translate([0,20,hPipe-165])
cube([0.2, 260, 160]);