/// ds_map = new_planet(name, room_type);

var map = ds_map_create();
map[? "name"] = argument0;
map[? "seed"] = randomize();
map[? "type"] = choose(
    terraintype.worms,
    terraintype.antfarm,
    terraintype.cheese,
    terraintype.machined);
map[? "color"] = choose(c_white, c_blue, c_green, c_purple, c_olive, c_orange);
map[? "room"] = argument1;    

var tileset = choose(tileset_terrain1, tileset_terrain2, tileset_terrain3);
map[? "tileset"] = tileset;

switch(tileset)
{
    case tileset_terrain1:  map[? "sprite"] = s_planet1;  break;
    case tileset_terrain2:  map[? "sprite"] = s_planet2;  break;        
    case tileset_terrain3:  map[? "sprite"] = s_planet3;  break;
}

return map;
