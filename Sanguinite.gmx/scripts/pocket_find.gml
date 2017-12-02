///pocket = pocket_find(grid, x, y);
/*    
    returns a pocket object representing a room at the coordinate
*/


var grid = argument0;
var xx = argument1;
var yy = argument2;

var val = ds_grid_get(grid, xx, yy);
if (val >= 1) return noone;

var pocket = instance_create(0, 0, obj_pocket);  
pocket_find_ext(grid, pocket, xx, yy, val); 

if (pocket_get_size(pocket) == 0) 
{
    with(pocket) instance_destroy();
    return noone;
}

with(pocket) 
{
    var size = ds_map_size(set);
    x = x div size;
    y = y div size;
    
    type = val;
}  
return pocket;

