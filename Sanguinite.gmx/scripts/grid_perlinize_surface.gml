///terrain_perlinize_surface(grid, octaves, surface_y);

var grid = argument0;
var octaves = argument1;
var surface_y = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

//clamp surface y
surface_y = min(surface_y, height-1);

//create perlin array, start with high amplitude and low frequency
var perlin_array = perlin_1d(width, octaves);

//var perlin_s = ""; //(debugging)

//apply perlin array to grid
for (var i = 0; i < width; i++) {

    //get perlin value for this column
    var val = perlin_array[i];
    
    //perlin_s += "[" + string(val) + "]"; //(debugging)
    
    //get bottom of this column
    var pizo = ds_grid_get(grid, i, surface_y);
    
    //iterate through elements of this column, starting at highest altitude
    for (var j = 0; j < surface_y; j++) {
        if (j == 0) {
            //if top row, always clear it
            ds_grid_set(grid, i, j, -1);
        }
        else {       
            // get normalized value for element in column between 0 and 1
            var k = 1 - (j / surface_y);
            if (pizo <= 0) {
                //if very bottom is missing, all the elements above will be missing
                if (k <= val) {
                    //close background
                    ds_grid_set(grid, i, j, 0);
                }
                else {
                    //open background
                    ds_grid_set(grid, i, j, -1);
                }
            }
            else {
                //the bottom is supported, so proceed as normal                
                //compare with perlin value
                if (k <= val) {
                    //wall
                    ds_grid_set(grid, i, j, 1);
                }
                else {
                    //empty space 
                    ds_grid_set(grid, i, j, -1);  
                }
            }
        }
    }
}

//free perlin array
perlin_array = 0;
