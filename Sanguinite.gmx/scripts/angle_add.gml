/// angle = angle_add(angle, degrees);
/*
    Adds degrees to an angle and clamps it between 0 and 360.
*/

var a = (argument0 + argument1) % 360;
if (a < 0) a += 360;
return a;
