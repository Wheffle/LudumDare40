///ds_list = grid_find_pockets(grid);
/*    
    returns a LIST of obj_pocket, each obj_pocket corresponds to a room 
    with unique coordinates the coordinates will be given as strings in 
    this form: "x,y"
*/


var grid = argument0;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var list = ds_list_create();

for (var i = 0; i < width; i++) {
    for (var j = 0; j < height; j++) {
        var val = ds_grid_get(grid, i, j);
        if (val <= 0) {
            var xys = coor_to_string(i, j);
            if (!pocket_list_has_coor(list, xys)) {
                //just found an empty tile that's not in a room currently:
                var pocket = pocket_find(grid, i, j);
                if (pocket != noone) ds_list_add(list, pocket);
            }
        }
    }
}

return list;

