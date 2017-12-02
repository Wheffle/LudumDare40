///grid_connect_pockets(grid, pocket_list);

var grid = argument0;
var pocket_list = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

//add pockets into a sorted list from smallest to largest
var sorted_list = ds_list_create();
while(ds_list_size(sorted_list) != ds_list_size(pocket_list)) 
{
    var size = width*height;
    var small_pocket = noone;
    for (var i = 0; i < ds_list_size(pocket_list); i++) 
    {
        var pocket = ds_list_find_value(pocket_list, i);
        if (ds_list_find_index(sorted_list, pocket) == -1 and 
            pocket_get_size(pocket) < size) 
            {
            size = pocket_get_size(pocket);
            small_pocket = pocket;
        }
    }
    ds_list_add(sorted_list, small_pocket);
}

//consolidate smallest pocket with pocket nearest to it with route
//until there is only one giant pocket left
while(ds_list_size(sorted_list) > 1) 
{
    //find the nearest pocket to the smallest pocket
    var smallest_pocket = ds_list_find_value(sorted_list, 0);
    var nearest_pocket = pocket_find_nearest(smallest_pocket, sorted_list, grid);
    if (!instance_exists(nearest_pocket)) 
    { 
        show_debug_message("!!! could not find nearest pocket!");
        break;
    }
    
    //create route between them, create a 'merged' pocket
    pocket_create_route(grid, smallest_pocket, nearest_pocket);
    var merged_pocket = pocket_merge(grid, smallest_pocket, nearest_pocket);
    
    //delete smallest pocket from list
    var smallest_idx = ds_list_find_index(sorted_list, smallest_pocket);
    ds_list_delete(sorted_list, smallest_idx);
    
    //delete nearest pocket from list, add it to maybe garbage list
    var nearest_idx = ds_list_find_index(sorted_list, nearest_pocket);
    ds_list_delete(sorted_list, nearest_idx);
    
    //insert new merged pocket into sorted list at proper position
    for(var i = 0; i <= ds_list_size(sorted_list); i++) 
    {
        if (i == ds_list_size(sorted_list)) 
        {
            ds_list_add(sorted_list, merged_pocket);
            break;
        }
        else {
            var p = ds_list_find_value(sorted_list, i);
            if (pocket_get_size(merged_pocket) <= pocket_get_size(p)) 
            {
                ds_list_insert(sorted_list, i, merged_pocket);
                break;
            }
        }
    }
}

//clean up sorted list and pockets that are not original from pocket_list
ds_list_destroy(sorted_list);
with(obj_pocket) 
{
    if (ds_list_find_index(pocket_list, id) == -1) 
    {
        instance_destroy();
    }
}

//"dig out" routes
with(obj_route) route_apply(id, grid, true);

//done
