/// damage_drone(drone_id, damage);

with(argument0)
{
    hp -= argument1;
    if (hp <= 0)
    {
        instance_create(x, y, obj_drone_dead);
        with(obj_dropship) alarm[0] = 120;
        repeat(3)
        {
            vfx_create_moon(x, y, 0.75, 0.25, 0, 180, 0.6, 0.1, c_gray);
        }
        instance_destroy();
    }
}
