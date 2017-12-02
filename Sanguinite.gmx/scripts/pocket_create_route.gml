///pocket_connect(grid, pocket1, pocket2);

var grid = argument0;
var pocket1 = argument1;
var pocket2 = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var route = instance_create(0, 0, obj_route);
route.pocket1 = pocket1;
route.pocket2 = pocket2;

//get border tiles from both pockets
var border_list1 = pocket_get_edge_tiles(pocket1, grid);
var border_list2 = pocket_get_edge_tiles(pocket2, grid);

//find the two border tiles that are closest
var dist = width*height;
for (var i = 0; i < width; i++) 
{
    for (var j = 0; j < height; j++) 
    {
        var xys1 = ds_list_find_value(border_list1, i);
        var xys2 = ds_list_find_value(border_list2, j);
        
        if (is_undefined(xys1) or is_undefined(xys2)) break;
        
        var x1 = string_to_coor_x(xys1);
        var y1 = string_to_coor_y(xys1);
        var x2 = string_to_coor_x(xys2);
        var y2 = string_to_coor_y(xys2);
        
        if ((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) < dist*dist) 
        {
            route.x1 = x1;
            route.x2 = x2;
            route.y1 = y1;
            route.y2 = y2;
            dist = point_distance(x1, y1, x2, y2);
        }
    }
}

