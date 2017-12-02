///terrain_id = terrain_generate(seed, density, smooth, [smallest_room], [smooth_thresh]);
/*    
    seed            :   randomized seed
    density         :   how "thick" the terrain is (between 0 and 1)
    smooth          :   how many smoothing passes (integer)
    [smallest_room] :   size, in cells, of the smallest room allowed (others will be pruned)
    [smooth_thresh] :   threshold for cellular automation algorithm
    
    returns :   instance_id of terrain controller
*/

var seed0 = argument[0];
var density0 = argument[1];
var smooth0 = argument[2];

var smallest_room0 = 12;
if (argument_count > 3) {
    smallest_room0 = argument[3];
}

var smooth_thresh0 = 4;
if (argument_count > 4) {
    smooth_thresh0 = argument[4];
}

with(obj_terrain) instance_destroy();
with(obj_pocket) instance_destroy();
with(obj_route) instance_destroy();

var o = instance_create(0, 0, obj_terrain);
with(o) {

    seed = seed0;
    density = density0;
    smooth = smooth0;
    smallest_room = smallest_room0;
    smooth_thresh = smooth_thresh0; 
    
    gen_active = true;
    gen_state = terraingen.start;
}

return o;

