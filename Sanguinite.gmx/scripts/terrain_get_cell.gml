/// boolean = terrain_get_cell(x, y);

with(obj_terrain)
{
    return ds_grid_get(grid, argument0, argument1);
}

return undefined;
