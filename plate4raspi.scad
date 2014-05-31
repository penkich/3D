x = 75;
y = 56;
d = 4; // ita atsumi
h = 3.5; // deppari
ita = [x,y,d];
ana1_loc = [5,12,0];
ana2_loc = [60.3,37.5,0];
ana3_loc = [5,45,0];

module ita(){
    cube(ita);
}

module ana(){
	difference(){
    		cylinder(r=3.0,d+h,$fs=0.1);
		translate([0,0,-1])
    		cylinder(r=1.4,d+h+2,$fs=0.1);
	}
}

translate(-ita/2+[0,0,d/2]){
	ita();
    translate(ana1_loc)
	ana();
    translate(ana2_loc)
	ana();
    translate(ana3_loc)
	ana();
}
