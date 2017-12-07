/// planet_begin();

with(obj_terrain)
{
    // Determine number of items
    var mines = 0;
    var min_artifacts = 0;
    var wall_enemies = 0;
    switch(room)
    {
        case rm_planet_small:
            mines = 2;
            wall_enemies = 2;
            min_artifacts = 2;
            break;
        
        case rm_planet_med:
            mines = 3;
            wall_enemies = 4;
            min_artifacts = 4;
            break;
            
        case rm_planet_large:
            mines = 4;
            wall_enemies = 10;
            min_artifacts = 6;
            break;
    }

    // Create items
    var cell_half = CELL div 2;
    if (is_last_level())
    {
        var deepest = "";
        var deepest_y = 0;
        with(obj_pocket)
        {
            if (string_length(deepest) == 0)
            {
                deepest = ds_map_find_first(set);
                deepest_y = string_to_coor_y(deepest);
            }
            else
            {
                var xys = ds_map_find_first(set);
                var yy = string_to_coor_y(xys);
                
                if (yy > deepest_y)
                {
                    deepest = xys;
                    deepest_y = yy;
                }
            }   
        }
        
        var grid_x = string_to_coor_x(deepest);
        var grid_y = string_to_coor_y(deepest);
        
        var xx = grid_x*CELL + cell_half;
        var yy = grid_y*CELL + cell_half;
        
        instance_create(xx, yy, obj_secrets);
    }
    else
    {
        var cell_half = CELL div 2;
        var list = ds_list_create();
        with(obj_pocket)
        {
            ds_list_add(list, id);
        }
        
        ds_list_shuffle(list);
        for (var i = 0; i < ds_list_size(list); i++)
        {
            var pocket = list[| i];
            with(pocket)
            {
                var xys = ds_map_find_first(set);
                var xys_list = ds_list_create();
                
                while(!is_undefined(xys))
                {
                    ds_list_add(xys_list, xys);
                    xys = ds_map_find_next(set, xys);
                }
                
                ds_list_shuffle(xys_list);
                xys = xys_list[| 0];
                ds_list_destroy(xys_list);
                
                var grid_x = string_to_coor_x(xys);
                var grid_y = string_to_coor_y(xys);
                
                var xx = grid_x*CELL + cell_half;
                var yy = grid_y*CELL + cell_half;
                
                var item_type = obj_artifact;
                if (mines > 3)
                {
                    item_type = obj_sanguinite2;
                }
                else if (mines > 2)
                {
                    item_type = obj_sanguinite1;
                }
                else if (mines > 0)
                {
                    item_type = obj_sanguinite0;
                }
                
                mines--;
                
                instance_create(xx, yy, item_type);
            }
        }
    
    
        // If there weren't enough pockets, make sure there are the right number
        // of mines and at least one artifact
        while(mines > 0)
        {
            var rand_x = irandom(width-1);
            var rand_y = irandom(height-1);
            if (!ds_grid_get(grid, rand_x, rand_y))
            {
                var xx = rand_x*CELL + cell_half;
                var yy = rand_y*CELL + cell_half;
                instance_create(xx, yy, obj_sanguinite0);
                mines--;
            }
        }
        
        while (instance_number(obj_artifact) < min_artifacts)
        {
            var rand_x = irandom(width-1);
            var rand_y = irandom(height-1);
            if (!ds_grid_get(grid, rand_x, rand_y))
            {
                var xx = rand_x*CELL + cell_half;
                var yy = rand_y*CELL + cell_half;
                instance_create(xx, yy, obj_artifact);
            }
        }
    
        ds_list_destroy(list);
    }
    
    // Spawn Dropship
    var dropship = instance_create(dropship_spawn_x, dropship_spawn_y, obj_dropship);
    view_object[0] = obj_dropship;
    
    // Spawn wall enemies
    with(obj_terrain)
    {
        // Find all walls
        var list = ds_list_create();
        for (var i = 1; i < width-1; i++)
        {
            for (var j = 1; j < height-1; j++)
            {
               if (ds_grid_get(grid, i, j) and
                  !(ds_grid_get(grid, i-1, j) and ds_grid_get(grid, i+1, j)))
               {
                    var xys = coor_to_string(i, j);
                    ds_list_add(list, xys);
               }
            }
        }
        
        // Pick a few to make wall enemies
        ds_list_shuffle(list);
        for (var i = 0; i < wall_enemies and i < ds_list_size(list); i++)
        {
            var xys = list[| i];
            var grid_x = string_to_coor_x(xys);
            var grid_y = string_to_coor_y(xys);
            
            var xx = grid_x*CELL + cell_half;
            var yy = grid_y*CELL + cell_half;
            instance_create(xx, yy, obj_enemy3);
        }
        
        ds_list_destroy(list);
    }
    
}
