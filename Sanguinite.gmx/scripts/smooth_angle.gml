///new_angle = smooth_angle(current_angle, target_angle, turn_speed);
/*
turns smoothly toward an angle

current_angle : current angle of object
target_angle : angle destination
turn_speed : how fast the object will turn
new_angle : new angle after calculations

VERSION 2- 12/7/2013
fixed the "bump" when crossing the 0 line at small incremaents
fixed some little oddities
*/

var current_angle,target_angle,turn_speed,diff,test,result;

current_angle = argument0;
target_angle = argument1;
turn_speed = argument2;

//find difference
diff = current_angle - target_angle;

//if difference is greater than turn speed, snap to target angle
test = abs(diff);
if (test > 180) test = abs(test - 360);

if (test <= turn_speed)
{
    result = target_angle;
}
//otherwise, move an increment
else
{
    //decide which way to turn
    if ((diff > 0 && diff < 180) || diff < -180)
        result = current_angle - turn_speed;
    else
        result = current_angle + turn_speed;

    //normalize result
    result = result mod 360;
    while (result < 0) result += 360;
}

return result;

