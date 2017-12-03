/// draw_planet(planet_index, x, y);

with(obj_player_properties)
{
    var p = planets[argument0];
    var xx = argument1;
    var yy = argument2;
    draw_sprite_ext(p[? "sprite"], 0, xx, yy, 1, 1, 0, p[? "color"], 1);
}
