/// grid_create_tiles();

with(obj_terrain) {       
    for (var i = 0; i < width; i++) {
        for (var j = 0; j < height; j++) {
            
            if (ds_grid_get(grid, i, j))
            {
                tile_add(terrain_graphic, 0, 0, CELL, CELL, CELL*i, CELL*j, 10000);
            }
        }
    }
}

