///pocket_find_ext(grid, pocket_id, x, y, space_type);
/*    
    adds the x,y coordinate to the pocket object and
    recurses on neighboring tiles that aren't in the set yet
*/


var grid = argument0;
var pocket = argument1;
var xx = argument2;
var yy = argument3;
var space_type = argument4;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

/*
    since GM apparently has major issues with deep recursion
    (which is the most sane way to do a paint-fill style
    algorithm), we are forced to do it iteratively...
*/

//create active queue and add first coordinate
var queue = ds_queue_create();
var xys = coor_to_string(xx, yy);
ds_queue_enqueue(queue, xys);

//keep performing function on coordinates in list until the list is empty
while(ds_queue_size(queue) > 0) 
{
    //get next coordinate
    xys = ds_queue_dequeue(queue);
    xx = string_to_coor_x(xys);
    yy = string_to_coor_y(xys);
    
    //check to see if point is valid
    if (xx >= 0 and xx < width and yy >= 0 and yy < height and
        ds_grid_get(grid, xx, yy) == space_type and
        !pocket_has_coor(pocket, xys)) 
    {
        //add coordinate to pocket, add neighboring cells to queue
        pocket_add_coor(pocket, xys);
        pocket.x += xx;
        pocket.y += yy;
        
        ds_queue_enqueue(queue, 
            coor_to_string(xx+1, yy),
            coor_to_string(xx-1, yy),
            coor_to_string(xx, yy+1),
            coor_to_string(xx, yy-1));
    }
}

