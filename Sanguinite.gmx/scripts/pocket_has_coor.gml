///bool = pocket_has_coor(pocket, xy_string);

var pocket = argument0;
var xys = argument1;

with(pocket) 
{
    return ds_map_exists(set, xys);
}

