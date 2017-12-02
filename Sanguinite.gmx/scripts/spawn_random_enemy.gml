/// enemy_id = spawn_random_enemy();

with(obj_terrain)
{
    var grid_x = 0;
    var grid_y = 0;
    do
    {
        var grid_x = irandom(width-1);
        var grid_y = irandom(height-1);
    }
    until(ds_grid_get(grid, grid_x, grid_y))
    
    var cell_half = CELL div 2;
    var xx = grid_x*CELL + cell_half;
    var yy = grid_y*CELL + cell_half;
    return instance_create(xx, yy, obj_enemy1);
}

return undefined;
