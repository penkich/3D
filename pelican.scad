module ring(){
	ht = 15;
	ri = 8;
	ro = ri+2.5;
	difference(){
		cylinder(h = ht, r = ro, $fn=360);
		cylinder(h = ht+1, r = ri, $fn=360);
		translate([-2,-2,0]){
			cube([35,35,ht+1]);
		}
	}
}

module pin(){
	w = 5;
	h = 50;
	translate([0,0,h/2]){
		cube([w,w,h],center=true);
	}
	translate([0,0,h-w/2]){
		sphere(r=w*0.9, $fn=360);
	}
}

pin();
translate([0,10,0])
rotate([0,0,45])
ring();
