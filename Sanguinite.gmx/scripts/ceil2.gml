///int = ceil2(int);
/*    
    returns the next highest power of 2 of the input
*/

var v = round(argument0);
v--;
v |= v >> 1;
v |= v >> 2;
v |= v >> 4;
v |= v >> 8;
v |= v >> 16;
v++;

return v;
