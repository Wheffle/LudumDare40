/// draw_message(width, height, text, color);

var w = argument0;
var h = argument1;
var half_w = w div 2;

var center_x = view_wview[0] div 2;
var x1 = center_x-half_w;
var y1 = 30;
var x2 = center_x+half_w;
var y2 = 34+h;

draw_set_alpha(0.5);

draw_set_color(c_white);
draw_roundrect(x1-4, y1-4, x2+4, y2+4, false);

draw_set_color(c_black);
draw_roundrect(x1-2, y1-2, x2+2, y2+2, false);

draw_set_alpha(1);

draw_set_color(argument3);
draw_set_font(font_small);
draw_text_ext(x1, y1, argument2, -1, w);

