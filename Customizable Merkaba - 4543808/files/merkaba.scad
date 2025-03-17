cote = 30;
thikness = .7;
echelle = 2;
viewSocle =false;
viewMerkaba=true;

viewMerkaba2=false;
module line(){
    //translate([-thikness/4,-thikness/2,-thikness/2])
    translate([0,0,-thikness*.75])
    cylinder(d=thikness*1.5,h=thikness*1.5,$fn=60);
    translate([cote,0,-thikness*.75])
    cylinder(d=thikness*1.5,h=thikness*1.5,$fn=60);
    translate([0,-thikness*0.75,-thikness*.75]){
        cube([cote,thikness*1.5,thikness*1.5]);
    }
};


module line2(){
    translate([0,-thikness*0.75,-thikness*.75])
        cube([cote/2,thikness*1.5,thikness*1.5]);
};

module cross_(){
    rotate([0,0,45])
    line();

    translate([0,cote*sin(45),0])
    rotate([0,0,-45])
    line();
}

module cross2(){
    rotate([0,0,45])
    line();

    translate([0,cote*sin(45),0])
    rotate([0,0,-45])
    line();
    
    translate([cote/2*cos(45),cote/2*sin(45),0]){
        rotate([0,45,0])
        line2();
        
        rotate([0,135,0])
        line2();
        
        rotate([0,135,90])
        line2();
        
        rotate([0,45,90])
        line2();
    }
}


module oneQuater(){
    cross_();
    rotate([0,-90,0]) cross_();
}

module oneQuater2(){
    cross_();
    rotate([0,-90,0]) cross2();
}

module oneHalf(){
    oneQuater();
    translate([cote*cos(45),0,cote*sin(45)])
    rotate([0,180,0]) oneQuater();
}

module oneHalf2(){
    oneQuater2();
    translate([cote*cos(45),0,cote*sin(45)])
    rotate([0,180,0]) oneQuater2();
}

module merkaba(){
    oneHalf();
    translate([cote*cos(45),0,0])
    rotate([0,0,90])
        oneHalf();
}

module merkaba2(){
    oneHalf2();
    translate([cote*cos(45),0,0])
    rotate([0,0,90])
        oneHalf2();
}

if (viewMerkaba)
scale ([echelle,echelle,echelle]) merkaba();
else if (viewMerkaba2)
    scale ([echelle,echelle,echelle]) merkaba2();

module socle(){
        translate([1,0,0]) cube ([cote,cote,3]);
        translate([cote/2,cote/2,0])
        difference(){
            invertPyramide();
            translate([0,0,cote/7.5]) invertPyramide();
            translate([-cote/1.7,-cote/1.9,cote/1.6]) cube ([cote*1.2,cote*1.2,cote/1.5]);
            translate([1-cote/2,-cote/2,-1]) cube ([cote,cote,1]);
        }
}

if (viewSocle)
translate([cote*echelle*1.5,0,0])
scale([echelle*0.6,echelle*.6,echelle*.6])
socle();

module invertPyramide(){
    translate([-cote/2,-cote/5,cote-5])
    rotate([13,0,0])
hull()
{
        line();
        rotate([0,0,60])
        line();
        rotate([0,60,0])
        line();
 }
}


