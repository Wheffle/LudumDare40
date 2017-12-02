/// terrain_create_landing_zone();

with(obj_terrain)
{
    // Find three surface blocks together
    var grid_land_x = -1;
    var grid_land_y = -1;
    var consecutive_blocks = 0;
    for (var j = 0; j < height; j++)
    {
        for (var i = 0; i < height; i++)
        {
            if (terrain_get_cell(i, j))
            {
                consecutive_blocks++;
                if (consecutive_blocks >= 3)
                {
                    grid_land_x = i-1;
                    grid_land_y = j;
                    break;
                }
            }
            else
            {
                consecutive_blocks = 0;
            }
        }
        
        if (grid_land_x > 0) break;
        consecutive_blocks = 0;
    }
    
    if (grid_land_x < 0)
    {
        grid_land_x = 1;
        grid_land_y = 1;
    }
    
    // Destroy terrain above them
    for (var i = grid_land_x-1; i <= grid_land_x+1; i++)
    {
        for (var j = 0; j < grid_land_y; j++)
        {
            ds_grid_set(grid, i, j, 0);
        }
    }
    
    // Set dropship spawn
    dropship_spawn_x = grid_land_x*CELL + (CELL div 2);
    dropship_spawn_y = -75;
}
