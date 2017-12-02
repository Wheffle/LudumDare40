///pocket = pocket_find_nearest(pocket, pocket_list, grid);

var pocket = argument0;
var pocket_list = argument1;
var grid = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var xx = pocket.x;
var yy = pocket.y;

var nearx = -1;
var neary = -1;
var r = 1;
while(r <= max(width, height)) 
{
    var x1 = xx-r;
    var y1 = yy-r;
    var x2 = xx+r;
    var y2 = yy+r;
    for (var i = x1; i <= x2; i++) 
    {
        for (var j = y1; j <= y2; j++) 
        {
            if ((i==x1 or i==x2 or j==y1 or j==y2) and
                i >= 0 and i < width and j >= 0 and j < height) 
                {
                var xys = coor_to_string(i, j);
                if (!pocket_has_coor(pocket, xys)) 
                {
                    //found a blank tile not belonging to this pocket!
                    for (var k = 0; k < ds_list_size(pocket_list); k++) 
                    {
                        var p = ds_list_find_value(pocket_list, k);
                        if (pocket_has_coor(p, xys)) 
                        {
                            return p;
                        }
                    }
                }
            }
        }
    }
    r++;
}

return noone;

