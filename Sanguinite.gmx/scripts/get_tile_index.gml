///idx = get_tile_index(up, down, left, right);


var up = argument0;
var down = argument1;
var left = argument2;
var right = argument3;

if (!up and !down and !left and !right) {
    return 1;
}
if (up and down and !left and !right) {
    return 2;
}
if (!up and !down and left and right) {
    return 3;
}
if (!up and down and left and right) {
    return 4;
}
if (up and !down and left and right) {
    return 5;
}
if (up and down and !left and right) {
    return 6;
}
if (up and down and left and !right) {
    return 7;
}
if (!up and down and !left and right) {
    return 8;
}
if (!up and down and left and !right) {
    return 9;
}
if (up and !down and !left and right) {
    return 11;
}
if (up and !down and left and !right) {
    return 10;
}
if (!up and down and !left and !right) {
    return 12;
}
if (up and !down and !left and !right) {
    return 13;
}
if (!up and !down and !left and right) {
    return 14;
}
if (!up and !down and left and !right) {
    return 15;
}
return 0;

