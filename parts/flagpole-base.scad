
$fn = 64;

//Pipe Support Section
dIntClearance = 0.5;
dPipe = 16.4 ; // 16mm alunminum external diameter 
wallPipe = 3.5; // size of pipe support wall
hPipeSupport = 16; // height of the pipe support section

//Base Section
dBase = 42;
hBase = 5;
dScrewHoles = 4.4;   // screw diameter
dHeadHoleClearance = 8; // space to the screw head
deltaHoles = 4;     // distance from base border to screw hole center

//Cone Section
dBaseCone = dBase - 8; // base size
hCone = 12; // height of the cone section



dIntPipe = dPipe + dIntClearance;
dExtPipe = dIntPipe + (wallPipe*2);
furoFinalBase = dIntPipe/1.3;


translate([0,0,0])    
    base(furos=2);



module base(furos = 4, rasgo = false) {


    //cano
    translate([0,0, hBase + hCone])
    difference(){
        
        minkowski(){
            cylinder(r=(dExtPipe/2)-1, h= hPipeSupport);
            sphere(r=1);
        }
        
        translate([0,0,-1])
        cylinder(r=dIntPipe/2, h= hPipeSupport+2);
        
        if(rasgo == true)
        for(i=[0:2:120]){
            translate([0,0,hFuroCanoBase])
            rotate([0,-90,i])
            translate([0,0,-25])
            cylinder(r=dFuroCanoBase/2, h=50);
        }
       
    }

    //cone
    translate([0,0, hBase])
    difference(){
        
        cylinder(r1=dBaseCone/2, r2=dExtPipe/2, h= hCone+1);
        
        cylinder(r=dIntPipe/2, h= hCone+1);
        
        translate([(dBase/2)-deltaHoles ,0,0])
        cylinder(r=dHeadHoleClearance/2, h= hCone+5);  
                
        translate([-(dBase/2)+deltaHoles ,0,0])
        cylinder(r=dHeadHoleClearance/2, h= hCone+5); 
        
        if( furos == 4) {
            translate([0, (dBase/2)-deltaHoles,0])
            cylinder(r=dHeadHoleClearance/2, h= hCone+5);  
                    
            translate([0,-(dBase/2)+deltaHoles,0])
            cylinder(r=dHeadHoleClearance/2, h= hCone+5); 
        }
    }

    //base

    difference(){

    translate([0,0,1])
        minkowski(){
                cylinder(r=dBase/2, h= hBase-1);
                      sphere(r=1);
        }  
               
        translate([0 ,0,-1]) 
        cylinder(r=furoFinalBase/2, h= hBase+2); //furo para fio 
        
        translate([(dBase/2)-deltaHoles ,0,-1])
        cylinder(r=dScrewHoles/2, h= hBase+2); 
        
        translate([-(dBase/2)+ deltaHoles ,0,-1])
        cylinder(r=dScrewHoles/2, h= hBase+2);
        
        if( furos == 4) {
            translate([0 ,(dBase/2)-deltaHoles,-1])
            cylinder(r=dScrewHoles/2, h= hBase+2); 
            
            translate([0 ,-(dBase/2)+ deltaHoles,-1])
            cylinder(r=dScrewHoles/2, h= hBase+2);
        }
        
    }
    
}