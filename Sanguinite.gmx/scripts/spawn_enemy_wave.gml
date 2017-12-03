/// spawn_enemy_wave();

switch(room)
{
    case rm_planet_small:
        repeat(7) spawn_random_enemy();
        break;
        
    case rm_planet_med:
        repeat(12) spawn_random_enemy();
        break;
        
    case rm_planet_large:
        repeat(20) spawn_random_enemy();
        break;
}

show_popup("Hostile surge detected.", c_red, 5);
