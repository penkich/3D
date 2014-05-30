r = 20;   // hankei
d = 0.3;  // astumi
n =  30;  // ca. n of teimen
n2 = 40;  // n of sokumen
namiw=2*r/n;
h=namiw/1.4142;

module plate(){
	translate([0,0,-h])
	cube([r*4,r*4,h],center=true);
}

module nami(){
  for(t=[-r:namiw:r]){
	translate([0,t,0])
	rotate([45,0,0]){
	    cube([r*2,namiw,namiw],center=true);
    }
   }
}

module nami_plate(){
	difference(){
		nami();
		plate();
    }
}

module inner(){
	for(t=[0:360/n2:360]){
		translate([r*sin(t),r*cos(t),-1.4])
		rotate(-t-60){
			rotate([-15,-15,-0])
			cube([7,7,9]);
		}
	}
}

module outer(){
	for(t=[0:360/n2:360]){
		translate([(r+d)*sin(t),(r+d)*cos(t),-2.5])
			rotate(-t-60){
			rotate([-15,-15,-0])
			cube([7,7,12]);
		}
	}
    // gomitori
	translate([-r,-r,0])
		cylinder(r=r/2,h=5,center=true);
	translate([r,-r,0])
		cylinder(r=r/2,h=5,center=true);
	translate([-r,r,0])
		cylinder(r=r/2,h=5,center=true);
	translate([r,r,0])
		cylinder(r=r/2,h=5,center=true);
}

difference(){
	inner();
	outer();
}

difference(){
	nami_plate();
	outer();
}

