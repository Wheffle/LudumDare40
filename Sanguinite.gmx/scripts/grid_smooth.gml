///grid_smooth(grid, threshold);
/*
    threshold determines the number of 'block' neighbors a cell has to have
    to maintain its current value for this pass. more neighbors will force
    it to a wall (1) and less will force it to a space (0).
*/

var grid = argument0;
var threshold = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var newgrid = ds_grid_create(width, height);
for (var i = 0; i < width; i++) {
    for (var j = 0; j < height; j++) {
        
        //get current grid value
        var val = ds_grid_get(grid, i, j);
    
        //get number of neighboring walls, counting off-grid sections
        var n = 0;
        for (var xx = -1; xx < 2; xx++) {
            for (var yy = -1; yy < 2; yy++) {
                var x0 = i + xx;
                var y0 = j + yy;
                if (xx != 0 or yy != 0) {                       
                    if (x0 < 0 or x0 >= width or y0 < 0 or y0 >= height) {
                        n++;
                    }
                    else if (ds_grid_get(grid, x0, y0) >= 1) {
                        n += 1;
                    }
                }
            }
        }
        
        //change cell based on neighbors
        if (n > threshold) { 
            ds_grid_set(newgrid, i, j, 1);
        }
        else if (n < threshold) {
            ds_grid_set(newgrid, i, j, 0);
        }
        else {
            ds_grid_set(newgrid, i, j, val);
        }
        
    }
} 

ds_grid_copy(grid, newgrid);
ds_grid_destroy(newgrid);
