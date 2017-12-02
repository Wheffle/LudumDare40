///grid_noise(grid, density, seed);


var grid = argument0;
var density = argument1;
var seed = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

random_set_seed(seed);

for (var i = 0; i < width; i++) 
{
    for (var j = 0; j < height; j++) 
    {    
        if (i == 0 or i == width-1 or j == 0 or j == height-1) 
        {               
            ds_grid_set(grid, i, j, 1);
        }
        else 
        {
            var r = random(1);
            if (r < density) 
            {
                ds_grid_set(grid, i, j, 1);
            }
            else 
            {
                ds_grid_set(grid, i, j, 0);
            }
        }
        
    }
}

