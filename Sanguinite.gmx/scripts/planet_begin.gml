/// planet_begin();

with(obj_terrain)
{
    // Create artifacts
    var cell_half = CELL div 2;
    with(obj_pocket)
    {
        var first = ds_map_find_first(set);
        var grid_x = string_to_coor_x(first);
        var grid_y = string_to_coor_y(first);
        
        var xx = grid_x*CELL + cell_half;
        var yy = grid_y*CELL + cell_half;
        instance_create(xx, yy, obj_artifact);
    }

    // Spawn Dropship
    var dropship = instance_create(dropship_spawn_x, dropship_spawn_y, obj_dropship);
    view_object[0] = obj_dropship;
}
