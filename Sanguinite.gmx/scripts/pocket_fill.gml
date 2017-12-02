///pocket_fill(pocket, grid);

var pocket = argument0;
var grid = argument1;

with(pocket) 
{
    var xys = ds_map_find_first(set);
    while(!is_undefined(xys)) 
    {
        var xx = string_to_coor_x(xys);
        var yy = string_to_coor_y(xys);
        ds_grid_set(grid, xx, yy, 1);
        xys = ds_map_find_next(set, xys);
    }        
    instance_destroy();
}

