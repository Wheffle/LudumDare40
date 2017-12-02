///real = string_to_coor_x(coor_string);

var xys = argument0;
var len = string_length(xys);

for (var i = 1; i <= len; i++) {
    var c = string_char_at(xys, i);
    if (c == ",") {
        var xs = string_copy(xys, 1, i-1);
        if (string_count(",", xs) > 0) show_debug_message("malformed coor string: " + xys);
        return real(xs);
    }
}   

show_debug_message("malformed coor string: " + xys);
return -1;

