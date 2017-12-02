///bool = pocket_list_has_coor(list, xy_string);

var list = argument0;
var xys = argument1;

for (var i = 0; i < ds_list_size(list); i++) 
{
    var pocket = ds_list_find_value(list, i);
    if (pocket_has_coor(pocket, xys)) return true;
}

return false;

