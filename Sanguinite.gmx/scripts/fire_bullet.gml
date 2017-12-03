/// bullet_id = fire_bullet(direction, speed, damage, area);

var bullet = instance_create(x, y, obj_bullet);
with(bullet)
{
    direction = argument0;
    speed = argument1;
    damage = argument2;
    image_angle = direction;
    area = argument3;
    
    if (damage < 2)
    {
        image_blend = c_yellow;
    }
    else if (damage < 3)
    {
        image_blend = c_aqua;
    }
    else
    {
        image_blend = c_white;
    }
}

return bullet;
