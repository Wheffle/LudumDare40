/// grid_create_tiles();

with(obj_terrain) {       
    for (var i = 0; i < width; i++) {
        for (var j = 0; j < height; j++) {
        
            var cell = ds_grid_get(grid, i, j);
            if (cell)
            {
                // Get neighbors
                var up = 1;
                var down = 1;
                var left = 1;
                var right = 1;
                
                if (j > 0) up = ds_grid_get(grid, i, j-1) >= 1;
                if (j < height-1) down = ds_grid_get(grid, i, j+1) >= 1;
                if (i > 0) left = ds_grid_get(grid, i-1, j) >= 1;
                if (i < width-1) right = ds_grid_get(grid, i+1, j) >= 1;
                
                // Get tile index
                var tileidx = get_tile_index(up, down, left, right);
                
                // Create tile
                var tile_left = CELL*(tileidx mod 4);
                var tile_top = CELL*floor(tileidx / 4);
                var tile = tile_add(terrain_graphic, tile_left, tile_top, CELL, CELL, CELL*i, CELL*j, 10000);
                tile_set_blend(tile, terrain_color);
            }
        }
    }
}

