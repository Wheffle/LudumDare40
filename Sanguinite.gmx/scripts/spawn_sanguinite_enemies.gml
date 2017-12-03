/// spawn_sanguinite_enemies(sanguinite_id);

with(argument0)
{
    switch(room)
    {
        case rm_planet_small:
            repeat(3)
            {
                instance_create(x-12+random(24), y+25, obj_enemy2);
            }
            break;
        
        case rm_planet_med:
            repeat(4)
            {
                instance_create(x-12+random(24), y+25, obj_enemy2);
            }
            break;
        
        case rm_planet_large:
            repeat(5)
            {
                instance_create(x-12+random(24), y+25, obj_enemy2);
            }
            break;
    }
}
