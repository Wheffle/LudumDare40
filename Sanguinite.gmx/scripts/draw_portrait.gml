/// draw_portrait(x, y, sprite);

var x1 = argument0;
var y1 = argument1;
var x2 = argument0+50;
var y2 = argument1+50;

draw_set_color(c_ltgray);
draw_roundrect(x1-2, y1-2, x2+2, y2+2, false);

draw_set_color(c_black);
draw_roundrect(x1, y1, x2, y2, false);

draw_sprite(argument2, 0, x1, y1);
