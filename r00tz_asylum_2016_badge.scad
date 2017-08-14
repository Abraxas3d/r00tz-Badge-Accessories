mmperinch = 25.4;
wall = (1/8)*mmperinch;
//width = x
//length = y
//height = z
$fn=50;
USBwidth = 0.75*mmperinch;
USBlength = 2*mmperinch;
USBheight = 0.6*mmperinch;
BadgeWidth = 1.9*mmperinch;
BadgeLength = 2*mmperinch;
BadgeHeight = 0.3*mmperinch;

BatteryWidth = 1.4*mmperinch;
BatteryLength = 2.7*mmperinch;
BatteryHeight = 0.8*mmperinch;

JoystickWidth = 1*mmperinch;
JoystickLength = 1*mmperinch;
JoystickHeight = wall;

WireCut = 0.3*mmperinch;

difference(){
    cube([BadgeWidth + 2*wall, BadgeLength + 2*wall, BadgeHeight + wall]); //solid block for main board
    translate([wall,wall,wall]) cube([BadgeWidth, BadgeLength, BadgeHeight]); //hollow out main board
    translate([0, mmperinch*(13/8), 0]) rotate([0,0,45]) cube(2*mmperinch, 2*mmperinch, mmperinch); //Cut off corner for IR LED
    
    translate([BadgeWidth + wall - USBwidth - (3/10)*mmperinch, -wall -(0.4)*mmperinch, -USBheight]) cube([USBwidth, USBlength + wall, mmperinch + wall]); //Hollow out USB Dongle - utility cut
}


    difference(){
    translate([BadgeWidth - USBwidth - (3/10)*mmperinch, -wall -(0.4)*mmperinch, -USBheight - wall]) cube([USBwidth + 2*wall, USBlength + 2*wall, USBheight + wall]); //solid block for USB dongle
    translate([BadgeWidth + wall - USBwidth - (3/10)*mmperinch, -wall -(0.4)*mmperinch, -USBheight]) cube([USBwidth, USBlength + wall, mmperinch + wall]); //Hollow out USB Dongle
}

translate([0,0,-USBheight - wall]) difference(){
    translate([BadgeWidth + wall, 0, 0]) cube([BatteryWidth + 2*wall, BatteryLength + 2*wall, BatteryHeight + wall]); //Block for battery
    translate([BadgeWidth + 2*wall, wall, wall]) cube([BatteryWidth, BatteryLength, BatteryHeight]); //hollow out block for battery
    translate([BadgeWidth + 2*wall + WireCut/2, 0, BatteryHeight]) cube([WireCut, WireCut, WireCut]); //square cut for wire hole
    translate([BadgeWidth + 2*wall + WireCut, wall, BatteryHeight]) rotate([90,0,0]) cylinder(r=WireCut/2,h=wall); //round bottom of wire hole   
}

translate([-JoystickWidth, 0.45*mmperinch, BadgeHeight]) cube([JoystickWidth, JoystickLength, JoystickHeight]); //landing pad for joystick
translate([BadgeWidth - (0.5)*USBwidth,0,-USBheight - wall]) cube([JoystickWidth, JoystickLength, JoystickHeight]); //connect USB and Battery for sturdiness