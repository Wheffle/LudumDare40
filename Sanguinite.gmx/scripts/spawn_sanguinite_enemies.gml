/// spawn_sanguinite_enemies(sanguinite_id);

with(argument0)
{
    switch(object_index)
    {
        case obj_sanguinite0:
            repeat(3)
            {
                instance_create(x-12+random(24), y+25, obj_enemy2);
            }
            break;
        
        case obj_sanguinite1:
            repeat(5)
            {
                instance_create(x-12+random(24), y+25, obj_enemy2);
            }
            break;
        
        case obj_sanguinite2:
            repeat(7)
            {
                instance_create(x-12+random(24), y+25, obj_enemy2);
            }
            break;
    }
}
