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
        // Get a random empty spot on the lowest possible row
    
        var xlist = ds_list_create();
        for (var i = 0; i < width; i++)
        {
            ds_list_add(xlist, i);
        }
        ds_list_shuffle(xlist);
        
        var xx = 0;
        var yy = 0;
        var found = false;
        for (var j = height-1; j >= 0; j--)
        {
            for (var xi = 0; xi < ds_list_size(xlist); xi++)
            {
                var grid_x = xlist[| xi];
                var grid_y = j;
                
                if (!ds_grid_get(grid, grid_x, grid_y))
                {
                    found = true;
                    xx = grid_x*CELL + cell_half;
                    yy = grid_y*CELL + cell_half;
                    break;
                }
            }
            
            if (found) break;
        }
        
        ds_list_destroy(xlist);
        
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
