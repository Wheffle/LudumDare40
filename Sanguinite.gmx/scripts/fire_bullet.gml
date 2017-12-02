/// bullet_id = fire_bullet(direction, speed, damage);

var bullet = instance_create(x, y, obj_bullet);
with(bullet)
{
    direction = argument0;
    speed = argument1;
    damage = argument2;
    image_angle = direction;
}

return bullet;
