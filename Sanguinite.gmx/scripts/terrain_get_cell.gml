/// boolean = terrain_get_cell(x, y);

with(obj_terrain)
{
    if (argument0 < 0 or argument0 >= ds_grid_width(grid) or
        argument1 < 0 or argument1 >= ds_grid_height(grid))
    {
        return false;
    }
    
    return ds_grid_get(grid, argument0, argument1);
}

return undefined;
