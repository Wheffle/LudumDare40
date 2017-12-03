/// enemy_id = spawn_random_enemy();

with(obj_terrain)
{
    var player_grid_x = -100;
    var player_grid_y = -100;
    
    with(obj_drone)
    {
        player_grid_x = x div CELL;
        player_grid_y = y div CELL;
    }
    
    var grid_x = 0;
    var grid_y = 0;
    do
    {
        var grid_x = irandom(width-1);
        var grid_y = irandom(height-1);
    }
    until(ds_grid_get(grid, grid_x, grid_y) and
          !distance_is_less(grid_x, grid_y, player_grid_x, player_grid_y, 5, false))
    
    var enemy_type = obj_enemy1;
    switch(room)
    {
        case rm_planet_small:
            enemy_type = obj_enemy1;
            break;
            
        case rm_planet_med:
            var dice = random(1);
            if (dice >= 0.95)
            {
                enemy_type = obj_enemy4;
            }
            else
            {
                enemy_type = obj_enemy1;
            }
            break;
            
        case rm_planet_large:
            var dice = random(1);
            if (dice >= 0.80)
            {
                enemy_type = obj_enemy4;
            }
            else
            {
                enemy_type = obj_enemy1;
            }
            break;
    }
    
    var cell_half = CELL div 2;
    var xx = grid_x*CELL + cell_half;
    var yy = grid_y*CELL + cell_half;
    return instance_create(xx, yy, enemy_type);
}

return undefined;
