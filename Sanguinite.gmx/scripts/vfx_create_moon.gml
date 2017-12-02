/// vfx_id = vfx_create_moon(x, y, speed, speed_wiggle, dir, dir_wiggle, size, size_wiggle, color);

var moon = instance_create(argument0, argument1, vfx_moon);
with(moon)
{
    speed = argument2 - argument3 + random(argument3*2);
    direction = argument4 - argument5 + random(argument5*2);
    
    var size = argument6 - argument7 + random(argument7*2);
    image_xscale = size;
    image_yscale = size;
    
    image_blend = argument8;
    
    image_angle = random(360);
}

return moon;
