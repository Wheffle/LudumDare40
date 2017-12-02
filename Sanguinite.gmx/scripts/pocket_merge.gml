///new_pocket = pocket_merge(grid, pocket1, pocket2);

var grid = argument0;
var pocket1 = argument1;
var pocket2 = argument2;

var new_pocket = instance_create(0, 0, obj_pocket);

with(pocket1) 
{
    var xys = ds_map_find_first(set);
    while(!is_undefined(xys)) 
    {
        pocket_add_coor(new_pocket, xys);
        xys = ds_map_find_next(set, xys);
    }
}

with(pocket2) 
{
    var xys = ds_map_find_first(set);
    while(!is_undefined(xys)) 
    {
        pocket_add_coor(new_pocket, xys);
        xys = ds_map_find_next(set, xys);
    }
}

var size1 = pocket_get_size(pocket1);
var size2 = pocket_get_size(pocket2);
var size_combined = size1 + size2;
new_pocket.x = floor((size1*pocket1.x + size2*pocket2.x)/size_combined);
new_pocket.y = floor((size1*pocket1.y + size2*pocket2.y)/size_combined);

return new_pocket;

