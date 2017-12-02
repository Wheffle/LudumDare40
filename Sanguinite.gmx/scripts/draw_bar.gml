/// draw_bar(x1, y1, x2, y2, color, text, text_color, progress);

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var width = x2 - x1;

draw_set_color(c_ltgray);
draw_roundrect(x1-2, y1-2, x2+2, y2+2, false);

draw_set_color(c_dkgray);
draw_roundrect(x1, y1, x2, y2, false);

draw_set_color(argument4);
draw_roundrect(x1, y1, x1+lerp(0, width, argument7), y2, false);

draw_set_font(font_small);
draw_set_color(argument6);

var xmid = x1 + (width div 2);
draw_set_halign(fa_center);

draw_text(xmid, y1+2, argument5);

draw_set_halign(fa_left);
