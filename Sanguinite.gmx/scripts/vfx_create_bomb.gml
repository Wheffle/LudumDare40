/// vfx_id = vfx_create_bomb(x, y, size, color);

var bomb = instance_create(argument0, argument1, vfx_bomb);
with(bomb)
{  
    image_xscale = argument2;
    image_yscale = argument2;
    
    image_blend = argument3;
}

return bomb;
