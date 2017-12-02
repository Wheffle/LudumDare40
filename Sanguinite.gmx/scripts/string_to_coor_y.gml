///real = string_to_coor_y(coor_string);

var xys = argument0;
var len = string_length(xys);

for (var i = 1; i <= len; i++) 
{
    var c = string_char_at(xys, i);
    if (c == ",") 
    {
        var ys = string_copy(xys, i+1, len-i);
        if (string_count(",", ys) > 0) show_debug_message("malformed coor string: " + xys);
        return real(ys);
    }
}   

show_debug_message("malformed coor string: " + xys);
return -1;

