///route_apply(route_id, grid, punch_background);

var route = argument0;
var grid = argument1;
var punch_background = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

with(route) 
{
    var dir = point_direction(x1, y1, x2, y2);
    var xx = x1;
    var yy = y1;
    
    do 
    {
        var round_x = round(xx);
        var round_y = round(yy);
        var new_val = 0;
        if (punch_background) new_val = -1;
        ds_grid_set_disk(grid, round_x, round_y, r, new_val);        
        if ((x2-xx)*(x2-xx) + (y2-yy)*(y2-yy) <= 1) 
        {
            xx = x2;
            yy = y2;
        }
        else 
        {
            xx = xx + lengthdir_x(1, dir);
            yy = yy + lengthdir_y(1, dir);
        }
    } until (xx == x2 and yy == y2) 
}

