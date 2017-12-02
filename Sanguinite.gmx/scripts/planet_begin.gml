/// planet_begin();

with(obj_terrain)
{
    // Create items
    var cell_half = CELL div 2;
    var list = ds_list_create();
    with(obj_pocket)
    {
        ds_list_add(list, id);
    }
    
    var mines = 2;
    ds_list_shuffle(list);
    for (var i = 0; i < ds_list_size(list); i++)
    {
        var pocket = list[| i];
        with(pocket)
        {
            var first = ds_map_find_first(set);
            var grid_x = string_to_coor_x(first);
            var grid_y = string_to_coor_y(first);
            
            var xx = grid_x*CELL + cell_half;
            var yy = grid_y*CELL + cell_half;
            
            var item_type = obj_artifact;
            if (mines > 0)
            {
                mines--;
                item_type = obj_sanguinite0;
            }
            
            instance_create(xx, yy, item_type);
        }
    }

    ds_list_destroy(list);
    
    // Spawn Dropship
    var dropship = instance_create(dropship_spawn_x, dropship_spawn_y, obj_dropship);
    view_object[0] = obj_dropship;
    
    // Spawn random-ass enemies
    repeat(10)
    {
        var ran_x = 25 + random(room_width-50);
        var ran_y = 25 + random(room_height-50);
        instance_create(ran_x, ran_y, obj_enemy1);
    }
}
