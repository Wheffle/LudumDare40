///boolean = distance_is_less(x0, y0, x1, y1, dist, true_if_equal);
/*
    Checks to see if the distance between two points is less than (or equal
    to) the given distance value (cheaply without using square root).
*/

var dx = argument2 - argument0;
var dy = argument3 - argument1;

if (argument5)
{
    return ((dx*dx) + (dy*dy)) <= (argument4*argument4);
}

return ((dx*dx) + (dy*dy)) < (argument4*argument4);


