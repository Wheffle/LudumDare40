///ds_list = pocket_get_edge_tiles(pocket, grid); 

var pocket = argument0;
var grid = argument1;
var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var list = ds_list_create();

with(pocket) 
{        
    var xys = ds_map_find_first(set);
    while(!is_undefined(xys)) 
    {
        var xx = string_to_coor_x(xys);
        var yy = string_to_coor_y(xys);
        
        if ((xx > 0 and xx < width-1 and yy > 0 and yy < height-1) and
            ((xx-1 > 0 and ds_grid_get(grid, xx-1, yy) != type) or
            (xx+1 < width-1 and ds_grid_get(grid, xx+1, yy) != type) or
            (yy-1 > 0 and ds_grid_get(grid, xx, yy-1) != type) or
            (yy+1 < height-1 and ds_grid_get(grid, xx, yy+1) != type))) 
        {
            ds_list_add(list, xys);
        }
                                
        xys = ds_map_find_next(set, xys);
    }
}

return list;

